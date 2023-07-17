part of 'doc_sign_up_bloc.dart';

@immutable
abstract class DocSignUpEvent extends Equatable {
  DocSignUpEvent();

  @override
  List<Object?> get props => [];
}

class DocChangePageEvent extends DocSignUpEvent {
  DocChangePageEvent({required this.page});
  final int page;
  @override
  List<Object?> get props => [];
}

class DocSignEmailEvent extends DocSignUpEvent {
  DocSignEmailEvent({required this.email});
  final String email;
  @override
  List<Object?> get props => [];
}

class DocSignPasswordEvent extends DocSignUpEvent {
  DocSignPasswordEvent({required this.password});
  final String password;
  @override
  List<Object?> get props => [];
}

class DocSignFullNameEvent extends DocSignUpEvent {
  DocSignFullNameEvent({required this.fullName});
  final String fullName;
  @override
  List<Object?> get props => [];
}

class DocSignGenderEvent extends DocSignUpEvent {
  DocSignGenderEvent({required this.gender});
  final String gender;
  @override
  List<Object?> get props => [];
}

class DocSignSpecialtyEvent extends DocSignUpEvent {
  DocSignSpecialtyEvent({required this.specialty});
  final String specialty;
  @override
  List<Object?> get props => [];
}

class DocSignHosNameEvent extends DocSignUpEvent {
  DocSignHosNameEvent({required this.hosName});
  final String hosName;
  @override
  List<Object?> get props => [];
}

class DocSignHosAddressEvent extends DocSignUpEvent {
  DocSignHosAddressEvent({required this.hosAddress});
  final String hosAddress;
  @override
  List<Object?> get props => [];
}

class DocCreateAccountEvent extends DocSignUpEvent {
  DocCreateAccountEvent(
  //     {
  //   required this.fullName,
  //   required this.email,
  //   required this.password,
  //   required this.gender,
  //   required this.specialty,
  //   required this.hosName,
  //   required this.hosAddress,
  // }
  );
  // final String email,
  //     password,
  //     fullName,
  //     hosAddress,
  //     gender,
  //     specialty,
  //     hosName;
  @override
  List<Object?> get props => [];
}
