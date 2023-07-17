part of 'doc_pat_bloc.dart';

enum DashBoardStatu {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingPatient,
  loadingPatientSuccess,
  loadingPatientFail,
}

@immutable
class DocPatState extends Equatable {
  DocPatState(
      {this.status = DashBoardStatu.loading,
      required this.doctor,
      this.page = 0,
      });

  DashBoardStatu status;
  DoctorDataModel? doctor;
  int page;

  DocPatState copyWith({
    DashBoardStatu? status,
    DoctorDataModel? doctor,
    int? page,

  }) {
    return DocPatState(
      status: status ?? this.status,
      doctor: doctor ?? this.doctor,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        status,
        doctor,
        page,
      ];
}
