import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:equatable/equatable.dart';

class BloodPressureHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BloodPressureFirstLoadState extends BloodPressureHistoryState {}

class BloodPressureLoadingState extends BloodPressureHistoryState {}

// List<Map<String, dynamic>> data;
class BloodPressureDataloadedState extends BloodPressureHistoryState {
  List<BloodPressureTimedData> smallDataList, bigDataList;
  BloodPressureDataloadedState({
    required this.smallDataList,
    required this.bigDataList,
  });
  @override
  List<Object?> get props => [this.smallDataList, this.bigDataList];
}
