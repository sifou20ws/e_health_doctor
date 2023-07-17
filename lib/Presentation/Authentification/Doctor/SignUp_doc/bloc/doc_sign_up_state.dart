part of 'doc_sign_up_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctors,
}

enum CreateAccStatus {
  initial,
  loading,
  success,
  fail,
  finish,
}

@immutable
class DocSignUpState extends Equatable {
  DocSignUpState({
    this.status = Status.initial,
    this.accStatus = CreateAccStatus.initial,
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.page = 0,
    this.fullName = '',
    this.hosAddress = '',
    this.gender = '',
    this.speciality = '',
    this.hosName = '',
    this.errorMessage = '',
  });
  Status status;
  CreateAccStatus accStatus;
  String email, password;
  bool? rememberMe;
  int page;
  String fullName, hosName, hosAddress, gender, speciality;
  String errorMessage;

  DocSignUpState copyWith({
    Status? status,
    CreateAccStatus? accStatus,
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? fullName,
    String? hosName,
    String? hosAddress,
    String? gender,
    String? speciality,
    String? errorMessage,
  }) {
    return DocSignUpState(
      status: status ?? this.status,
      accStatus: accStatus ?? this.accStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      fullName: fullName ?? this.fullName,
      hosName: hosName ?? this.hosName,
      hosAddress: hosAddress ?? this.hosAddress,
      gender: gender ?? this.gender,
      speciality: speciality ?? this.speciality,
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
        fullName,
        gender,
        hosName,
        hosAddress,
        speciality,
        errorMessage
      ];
}
