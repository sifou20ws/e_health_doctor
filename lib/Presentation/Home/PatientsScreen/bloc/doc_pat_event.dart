part of 'doc_pat_bloc.dart';

@immutable
abstract class DocPatEvent extends Equatable {
  const DocPatEvent();

  @override
  List<Object?> get props => [];
}

class GetPatEvent extends DocPatEvent {
  final String uid;
  final List<dynamic> patList;
  GetPatEvent({required this.patList, required this.uid});
}
class ChangeScreenEvent extends DocPatEvent {
  final int page;
  ChangeScreenEvent({required this.page});
}