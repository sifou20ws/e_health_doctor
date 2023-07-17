import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/Models/Doctor_data_model.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/Models/Patient_data_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'doc_dash_board_event.dart';
part 'doc_dash_board_state.dart';

class DocDashBoardBloc extends Bloc<DocDashBoardEvent, DocDashBoardState> {

  DocDashBoardBloc() : super(DocDashBoardState(doctor: DoctorDataModel())) {
    on<GetDoctorEvent>(_getDoctorEvent);
    on<ChangeScreenEvent>(_changeScreenEvent);
    on<ChangeSubScreenEvent>(_changeSubScreenEvent);
    on<GetPatEvent>(_getPatEvent);
  }

  FutureOr<void> _getDoctorEvent(
      GetDoctorEvent event, Emitter<DocDashBoardState> emit) async {
    emit(state.copyWith(status: DashBoardStatus.loadingDoctor));
    DoctorDataModel _doctor = await getDoctorsData(uid: event.uid);
    // log(_doctor.patientsIDs.toString());
    emit(state.copyWith(
        doctor: _doctor, status: DashBoardStatus.loadingDoctorSuccess));
    // log('get doctor sucess');
    // emit(state.copyWith(status: DashBoardStatus.loadingPatient));
    // List<PatientDataModel> _patients =
    // await getPatientData(uid: event.uid, patList: _doctor.patientsIDs);
    // emit(state.copyWith(
    //   patients: _patients,
    //   status: DashBoardStatus.loadingPatientSuccess,
    // ));
    // log(_patients.toString());
  }

  FutureOr<void> _changeScreenEvent(
      ChangeScreenEvent event, Emitter<DocDashBoardState> emit) {
    emit(state.copyWith(page: event.page));
  }

  FutureOr<void> _getPatEvent(
      GetPatEvent event, Emitter<DocDashBoardState> emit) async {
    emit(state.copyWith(status: DashBoardStatus.loadingPatient));
    List<PatientDataModel> _patients =
        await getPatientData(uid: event.uid, patList: event.patList);
    emit(state.copyWith(
      patients: _patients,
      status: DashBoardStatus.loadingPatientSuccess,
    ));
    log('get patient sucess');
    log(_patients.toString());
    // log(_patients.toString());
  }


  FutureOr<void> _changeSubScreenEvent(ChangeSubScreenEvent event, Emitter<DocDashBoardState> emit) {
    emit(state.copyWith(subPage: event.subPage , patUid: event.patUid));

  }
}
