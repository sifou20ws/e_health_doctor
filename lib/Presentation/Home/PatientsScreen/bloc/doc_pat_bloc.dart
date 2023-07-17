import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/Models/Doctor_data_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'doc_pat_event.dart';
part 'doc_pat_state.dart';

class DocPatBloc extends Bloc<DocPatEvent, DocPatState> {
  DocPatBloc() : super(DocPatState(doctor: DoctorDataModel())) {
    // on<GetDoctorEvent>(_getPatientEvent);
    on<ChangeScreenEvent>(_changeScreenEvent);
    // on<GetPatEvent>(_getPatEvent);

  }

  // FutureOr<void> _getPatEvent(
  //     GetPatEvent event, Emitter<DocDashBoardState> emit) async {
  //   // emit(state.copyWith(status: DashBoardStatus.loadingPatient));
  //   List<PatientDataModel> _patients =
  //   await getPatientData(uid: event.uid, patList: event.patList);
  //   emit(state.copyWith(
  //     patients: _patients,
  //     // status: DashBoardStatus.loadingPatientSuccess,
  //   ));
  //   log('get patient sucess');
  //   // log(_patients.toString());
  //   // log(_patients.toString());
  // }

  FutureOr<void> _changeScreenEvent(ChangeScreenEvent event, Emitter<DocPatState> emit) {
    emit(state.copyWith(page: event.page));
  }
}
