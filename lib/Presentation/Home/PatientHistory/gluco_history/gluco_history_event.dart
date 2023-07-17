import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:equatable/equatable.dart';

class GlucoHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlucoLoadData extends GlucoHistoryEvent {
  String uid;
  SelectedView selectedView;
  DateTime? dateTime;
  GlucoLoadData({required this.uid, this.dateTime, required this.selectedView});
  @override
  List<Object?> get props => [this.uid, this.selectedView, this.dateTime];
}
