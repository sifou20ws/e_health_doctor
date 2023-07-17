part of 'doc_log_in_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctors,
}

enum LoginAccStatus {
  initial,
  loading,
  success,
  fail,
  finish,
}

@immutable
class DocLogInState extends Equatable {
  DocLogInState({
    this.status = Status.initial,
    this.accStatus = LoginAccStatus.initial,
    this.email = 'doctor1@gmail.com',
    this.password = '12345678',
    this.rememberMe = false,
    this.page = 0,
    this.errorMessage = '',
  });
  Status status;
  LoginAccStatus accStatus;
  String email, password;
  bool? rememberMe;
  int page;
  String errorMessage;

  DocLogInState copyWith({
    Status? status,
    LoginAccStatus? accStatus,
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? errorMessage,
  }) {
    return DocLogInState(
      status: status ?? this.status,
      accStatus: accStatus ?? this.accStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

//nothing
  @override
  List<Object?> get props => [
        status,
        accStatus,
        email,
        password,
        rememberMe,
        page,
        errorMessage
      ];
}
