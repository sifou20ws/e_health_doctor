import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationServices {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<CreateAccountResult> createNewUser(
      {required String email, required String password}) async {
    try {
      CreateAccountResult res;
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        res = CreateAccountResult(
            success: true,
            uid: result.user!.uid.toString(),
            message: 'Account has been created');
      } else {
        res = CreateAccountResult(
            success: false, message: 'Creation of the account has failed');
      }
      return res;
    } catch (e) {
      CreateAccountResult res;
      res = CreateAccountResult(
          success: false,
          message: 'Failed to create your account \n' + e.toString());

      return res;
    }
  }

  Future<CreateAccountResult> addDocInfoToDB({
    required String uid,
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required String speciality,
    required String hosName,
    required String hosAddress,
  }) async {
    CreateAccountResult res;
    var user = FirebaseFirestore.instance.collection('Doctors');

    final json = {
      'Full name': fullName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Speciality': speciality,
      'HosName': hosName,
      'HosAddress': hosAddress,
      'IDs': FieldValue.arrayUnion([])
    };
    try {
      await user.doc(uid).set(json);
      // await user.doc(uid).collection('Patients List').doc('IDs').set(
      //   {'IDs': FieldValue.arrayUnion([])},
      // );
      return res = CreateAccountResult(
          success: true, message: 'Data added successfully');
    } catch (e) {
      return res = CreateAccountResult(success: false, message: e.toString());
    }
  }

  Future<CreateAccountResult> signIn(
      {required String email, required String password}) async {
    CreateAccountResult res;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        log('user uid :' + user.uid.toString());
        // return user.uid.toString();
        return res = CreateAccountResult(success: true, message: 'Logged in successfully' ,uid:user.uid.toString() );

      } else
        return res = CreateAccountResult(success: false, message: 'Logged in was not successful');
    } catch (e) {
      log(e.toString());
      return res = CreateAccountResult(success: false, message: 'Logged in was not successful'+ e.toString());

    }
  }

}

class CreateAccountResult {
  CreateAccountResult({
    this.uid = '',
    required this.success,
    this.message = '',
  });
  final String uid, message;
  final bool success;
}

class AddDataToFireStore {
  AddDataToFireStore({
    required this.success,
    required this.error,
  });
  final String error;
  final bool success;
}
