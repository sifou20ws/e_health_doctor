import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health_doctor/Services/AuthenticationServices.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'doc_sign_up_event.dart';
part 'doc_sign_up_state.dart';

class DocSignUpBloc extends Bloc<DocSignUpEvent, DocSignUpState> {
  DocSignUpBloc() : super(DocSignUpState()) {
    on<DocChangePageEvent>(_docSignInEvent);
    on<DocSignEmailEvent>(_docSignEmailEvent);
    on<DocSignPasswordEvent>(_docSignPasswordEvent);
    on<DocSignFullNameEvent>(_docSignFullNameEvent);
    on<DocSignGenderEvent>(_docSignGenderEvent);
    on<DocSignSpecialtyEvent>(_docSignSpecialtyEvent);
    on<DocSignHosNameEvent>(_docSignHosNameEvent);
    on<DocSignHosAddressEvent>(_docSignHosAddressEvent);
    on<DocCreateAccountEvent>(_docCreateAccountEvent);
  }

  FutureOr<void> _docSignInEvent(
      DocChangePageEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(page: event.page));
    log(state.page.toString());
  }

  FutureOr<void> _docSignEmailEvent(
      DocSignEmailEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _docSignPasswordEvent(
      DocSignPasswordEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _docSignFullNameEvent(
      DocSignFullNameEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  FutureOr<void> _docSignGenderEvent(
      DocSignGenderEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _docSignSpecialtyEvent(
      DocSignSpecialtyEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(speciality: event.specialty));
  }

  FutureOr<void> _docSignHosNameEvent(
      DocSignHosNameEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(hosName: event.hosName));
  }

  FutureOr<void> _docSignHosAddressEvent(
      DocSignHosAddressEvent event, Emitter<DocSignUpState> emit) {
    emit(state.copyWith(hosAddress: event.hosAddress));
  }

  FutureOr<void> _docCreateAccountEvent(
      DocCreateAccountEvent event, Emitter<DocSignUpState> emit) async {
    AuthenticationServices service = AuthenticationServices();
    emit(state.copyWith(accStatus: CreateAccStatus.loading));

    CreateAccountResult result = await service.createNewUser(
      email: state.email,
      password: state.password,
    );

    if (result.success) {
      CreateAccountResult res = await service.addDocInfoToDB(
        email: state.email,
        password: state.password,
        uid: result.uid,
        gender: state.gender,
        fullName: state.fullName,
        speciality: state.speciality,
        hosName: state.hosName,
        hosAddress: state.hosAddress,
      );

      if (res.success) {
        emit(state.copyWith(
          accStatus: CreateAccStatus.success,
          errorMessage: result.message,
        ));
        log(result.uid);
      } else {
        log(result.message);
        emit(state.copyWith(
          accStatus: CreateAccStatus.fail,
          errorMessage: result.message,
        ));
      }
    } else {
      log(result.message);
      emit(state.copyWith(
        accStatus: CreateAccStatus.fail,
        errorMessage: result.message,
      ));
    }
  }
}
