part of 'doc_dash_board_bloc.dart';

enum DashBoardStatus {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctor,
  loadingDoctorSuccess,
  loadingDoctorFail,
  loadingPatient,
  loadingPatientSuccess,
  loadingPatientFail,
}

@immutable
class DocDashBoardState extends Equatable {
  DocDashBoardState(
      {this.status = DashBoardStatus.loading,
      required this.doctor,
      this.page = 0,
      this.subPage = 0,
      this.patUid = '',
      this.patients = const []});

  DashBoardStatus status;
  DoctorDataModel? doctor;
  List<PatientDataModel> patients;
  int page, subPage;
  String patUid;
  DocDashBoardState copyWith({
    DashBoardStatus? status,
    DoctorDataModel? doctor,
    int? page,
    int? subPage,
    String? patUid,
    List<PatientDataModel>? patients,
  }) {
    return DocDashBoardState(
      status: status ?? this.status,
      doctor: doctor ?? this.doctor,
      page: page ?? this.page,
      patients: patients ?? this.patients,
      subPage: subPage ?? this.subPage,
      patUid: patUid ?? this.patUid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        doctor,
        page,
        patients,
        subPage,
        patUid,
      ];
}
