import 'package:cloud_firestore/cloud_firestore.dart';

class MeasurementsModel {
  final List<Map<String, dynamic>> pressure, glucose, heartBeat, temperature;

  MeasurementsModel({
    this.pressure = const [],
    this.glucose = const [],
    this.heartBeat = const [],
    this.temperature = const [],
  });

  toJson() {
    return {
      'Blood pressure': pressure,
      'Glucose': glucose,
      'Email': heartBeat,
      'Password': temperature,
    };
  }

  factory MeasurementsModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // print(doc.id);
    return MeasurementsModel(
      pressure: data['Blood pressure'],
      glucose: data['Glucose'],
      heartBeat: data['Email'],
      temperature: data['Password'],
    );
  }

  factory MeasurementsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return MeasurementsModel(
      pressure: data['Blood pressure'],
      glucose: data['Glucose'],
      heartBeat: data['Email'],
      temperature: data['Password'],
    );
  }
}

// Future<MeasurementsModel> getPatientData({required String uid}) async {
//   final CollectionReference usersRef =
//       FirebaseFirestore.instance.collection('Patients');
//   final DocumentSnapshot snapshot = await usersRef.doc(uid).get();
//   return MeasurementsModel.fromFirestore(snapshot);
// }
