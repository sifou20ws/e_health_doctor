import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorDataModel {
  final String? id;
  final String email,
      fullName,
      gender,
      hosAddress,
      hosName,
      password,
      speciality;
  final List<dynamic> patientsIDs;
  DoctorDataModel(
      {this.id,
        this.email='',
        this.fullName='',
        this.gender='',
        this.hosAddress='',
        this.hosName='',
        this.password='',
        this.speciality='',
        this.patientsIDs=const []});

  toJson() {
    return {
      'Full name': fullName,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'Speciality': speciality,
      'HosName': hosName,
      'HosAddress': hosAddress,
      'IDs': patientsIDs,
    };
  }

  factory DoctorDataModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // print(doc.id);
    return DoctorDataModel(
      id: doc.id,
      email: data['Email'],
      fullName: data['Full name'],
      gender: data['Gender'],
      hosAddress: data['HosAddress'],
      hosName: data['HosName'],
      password: data['Password'],
      speciality: data['Speciality'],
      patientsIDs: data['IDs'],
    );
  }

  factory DoctorDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return DoctorDataModel(
      id: document.id,
      email: data['Email'],
      fullName: data['Full name'],
      gender: data['Gender'],
      hosAddress: data['HosAddress'],
      hosName: data['HosName'],
      password: data['Password'],
      speciality: data['Speciality'],
      patientsIDs: data['IDs'],
    );
  }
}

Future<DoctorDataModel> getDoctorsData({required String uid}) async {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Doctors');
  final DocumentSnapshot snapshot = await usersRef.doc(uid).get();
  return DoctorDataModel.fromFirestore(snapshot);
}