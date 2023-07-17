
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:equatable/equatable.dart';

class HeartBeatHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HeartBeatLoadData extends HeartBeatHistoryEvent {
  String uid;
  SelectedView selectedView;
  DateTime? dateTime;
  HeartBeatLoadData(
      {required this.uid, this.dateTime, required this.selectedView});
  @override
  List<Object?> get props => [this.uid, this.selectedView, this.dateTime];
}
