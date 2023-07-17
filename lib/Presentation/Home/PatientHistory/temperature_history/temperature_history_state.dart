import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:equatable/equatable.dart';

class TemperatureHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TemperatureFirstLoadState extends TemperatureHistoryState {}

class TemperatureLoadingState extends TemperatureHistoryState {}

// List<Map<String, dynamic>> data;
class TemperatureDataLoadedState extends TemperatureHistoryState {
  List<TemperatureTimedData> smallDataList, bigDataList;
  TemperatureDataLoadedState({
    required this.smallDataList,
    required this.bigDataList,
  });
  @override
  List<Object?> get props => [this.smallDataList, this.bigDataList];
}
