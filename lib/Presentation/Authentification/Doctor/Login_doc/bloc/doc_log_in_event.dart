part of 'doc_log_in_bloc.dart';

@immutable
abstract class DocLogInEvent extends Equatable {
  DocLogInEvent();

  @override
  List<Object?> get props => [];
}

class DocChangePageEvent extends DocLogInEvent {
  DocChangePageEvent({required this.page});
  final int page;
  @override
  List<Object?> get props => [];
}

class DocSignEmailEvent extends DocLogInEvent {
  DocSignEmailEvent({required this.email});
  final String email;
  @override
  List<Object?> get props => [];
}

class DocSignPasswordEvent extends DocLogInEvent {
  DocSignPasswordEvent({required this.password});
  final String password;
  @override
  List<Object?> get props => [];
}

class DocSignFullNameEvent extends DocLogInEvent {
  DocSignFullNameEvent({required this.fullName});
  final String fullName;
  @override
  List<Object?> get props => [];
}

class DocSignGenderEvent extends DocLogInEvent {
  DocSignGenderEvent({required this.gender});
  final String gender;
  @override
  List<Object?> get props => [];
}

class DocSignSpecialtyEvent extends DocLogInEvent {
  DocSignSpecialtyEvent({required this.specialty});
  final String specialty;
  @override
  List<Object?> get props => [];
}

class DocSignHosNameEvent extends DocLogInEvent {
  DocSignHosNameEvent({required this.hosName});
  final String hosName;
  @override
  List<Object?> get props => [];
}

class DocSignHosAddressEvent extends DocLogInEvent {
  DocSignHosAddressEvent({required this.hosAddress});
  final String hosAddress;
  @override
  List<Object?> get props => [];
}

class LoginEvent extends DocLogInEvent {
  LoginEvent();

  @override
  List<Object?> get props => [];
}
