import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDataModel {
  final String? id;
  final String email,
      fName,
      lName,
      gender,
      blood,
      dateOfBirth,
      phone,
      weight,
      password;

  PatientDataModel({
    this.id = '',
    this.email = '',
    this.password = '',
    this.fName = '',
    this.lName = '',
    this.gender = '',
    this.blood = '',
    this.dateOfBirth = '',
    this.phone = '',
    this.weight = '',
  });

  toJson() {
    return {
      'First name': fName,
      'Last name': lName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Blood': bool,
      'Date of birth': dateOfBirth,
      'Phone': phone,
      'Weight': weight,
    };
  }

  factory PatientDataModel.fromFirestore(
      {required DocumentSnapshot doc, required List<dynamic> patList}) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    if (patList.contains(doc.id)) {
      return PatientDataModel(
        id: doc.id,
        email: data['Email'],
        password: data['Password'],
        fName: data['First name'],
        lName: data['Last name'],
        gender: data['Gender'],
        blood: data['Blood'],
        dateOfBirth: data['Date of birth'],
        phone: data['Phone'],
        weight: data['Weight'],
      );
    } else
      return PatientDataModel();
  }

  factory PatientDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PatientDataModel(
      id: document.id,
      email: data['Email'],
      password: data['Password'],
      fName: data['First name'],
      lName: data['Last name'],
      gender: data['Gender'],
      blood: data['Password'],
      dateOfBirth: data['Date of birth'],
      phone: data['Phone'],
      weight: data['Weight'],
    );
  }
}

Future<List<PatientDataModel>> getPatientData(
    {required String uid, required List<dynamic> patList}) async {
  List<PatientDataModel> accounts = [];
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Patients');
  final QuerySnapshot snapshot = await usersRef.get();
  // log(snapshot.docs.toString());
  for (QueryDocumentSnapshot doc in snapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (patList.contains(doc.id)) {
      accounts.add(
        PatientDataModel(
          id: doc.id,
          email: data['Email'],
          password: data['Password'],
          fName: data['First name'],
          lName: data['Last name'],
          gender: data['Gender'],
          blood: data['Blood'],
          dateOfBirth: data['Date of birth'],
          phone: data['Phone'],
          weight: data['Weight'],
        ),
      );
    }
  }
  return accounts;
  // return snapshot.docs
  //     .map((doc) => PatientDataModel.fromFirestore(doc: doc, patList: patList))
  //     .toList();
}
