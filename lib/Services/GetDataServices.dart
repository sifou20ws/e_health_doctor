import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getMeasurementData({
    required String uid,
    required String type,
  }) async {

    List<Map<String, dynamic>> dataList = [];
    final CollectionReference usersRef = FirebaseFirestore.instance.collection('Measurements');
    final DocumentSnapshot snapshot = await usersRef.doc(uid).get();
    List<dynamic> data =snapshot.get(type);
    for (int i = 0; i < data.length; i++) {
      Map<String, dynamic> value = data[i];
      dataList.add(value);
      // log(dataList[i].toString());
    }
    
    // return PatientDataModel.fromFirestore(snapshot);
    return dataList;
  }

  Future<List<Map<String, dynamic>>> getDocInfo({
    required String uid,
  }) async {

    List<Map<String, dynamic>> dataList = [];
    final CollectionReference usersRef = FirebaseFirestore.instance.collection('Doctors');
    final DocumentSnapshot snapshot = await usersRef.doc(uid).get();

    // return PatientDataModel.fromFirestore(snapshot);
    return dataList;
  }
}
