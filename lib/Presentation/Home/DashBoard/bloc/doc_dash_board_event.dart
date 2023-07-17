part of 'doc_dash_board_bloc.dart';

@immutable
abstract class DocDashBoardEvent extends Equatable {
  const DocDashBoardEvent();

  @override
  List<Object?> get props => [];
}

class GetDoctorEvent extends DocDashBoardEvent {
  final String uid;
  GetDoctorEvent({required this.uid});
}

class GetPatEvent extends DocDashBoardEvent {
  final String uid;
  final List<dynamic> patList;
  GetPatEvent({required this.patList, required this.uid});
}

class ChangeScreenEvent extends DocDashBoardEvent {
  final int page;
  ChangeScreenEvent({required this.page});
}
class ChangeSubScreenEvent extends DocDashBoardEvent {
  final int subPage;
  final String patUid;
  ChangeSubScreenEvent({required this.subPage , required this.patUid});
}
