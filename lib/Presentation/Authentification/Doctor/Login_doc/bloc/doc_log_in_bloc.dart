import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health_doctor/Services/AuthenticationServices.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'doc_log_in_event.dart';
part 'doc_log_in_state.dart';

class DocLogInBloc extends Bloc<DocLogInEvent, DocLogInState> {
  DocLogInBloc() : super(DocLogInState()) {
    on<DocChangePageEvent>(_docSignInEvent);
    on<DocSignEmailEvent>(_docSignEmailEvent);
    on<DocSignPasswordEvent>(_docSignPasswordEvent);
    on<LoginEvent>(_docLogInEvent);
  }

  FutureOr<void> _docSignInEvent(
      DocChangePageEvent event, Emitter<DocLogInState> emit) {
    emit(state.copyWith(page: event.page));
    log(state.page.toString());
  }

  FutureOr<void> _docSignEmailEvent(
      DocSignEmailEvent event, Emitter<DocLogInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _docSignPasswordEvent(
      DocSignPasswordEvent event, Emitter<DocLogInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _docLogInEvent(
      LoginEvent event, Emitter<DocLogInState> emit) async {
    AuthenticationServices service = AuthenticationServices();
    emit(state.copyWith(accStatus: LoginAccStatus.loading));

    CreateAccountResult result = await service.signIn(
      email: state.email,
      password: state.password,
    );

    if (result.success) {
      log(result.uid);
      emit(state.copyWith(
        accStatus: LoginAccStatus.success,
        errorMessage: result.message,
      ));
    } else {
      log(result.message);
      emit(state.copyWith(
        accStatus: LoginAccStatus.fail,
        errorMessage: result.message,
      ));
    }
  }
}
