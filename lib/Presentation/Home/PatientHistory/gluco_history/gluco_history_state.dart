import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:equatable/equatable.dart';

class GlucoHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlucoFirstLoadState extends GlucoHistoryState {}

class GlucoLoadingState extends GlucoHistoryState {}

// List<Map<String, dynamic>> data;
class GlucoDataloadedState extends GlucoHistoryState {
  List<GlucoseTimedData> smallDataList, bigDataList;
  GlucoDataloadedState({
    required this.smallDataList,
    required this.bigDataList,
  });
  @override
  List<Object?> get props => [this.smallDataList, this.bigDataList];
}
