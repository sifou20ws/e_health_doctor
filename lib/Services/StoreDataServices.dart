
import 'package:e_health_doctor/Services/AuthenticationServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreDataServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<CreateAccountResult> uploadData(
      {required String uid,
      required String type,
      required Map<String, dynamic> data}) async {
    CreateAccountResult res;

    var user = FirebaseFirestore.instance.collection('Measurements').doc(uid);

    try {
      await user.update({
        '$type': FieldValue.arrayUnion([data]),
      });
      return res =
          CreateAccountResult(success: true, uid: 'Data added successfully');
    } catch (e) {
      return res = CreateAccountResult(success: false, uid: e.toString());
    }

  }

}
