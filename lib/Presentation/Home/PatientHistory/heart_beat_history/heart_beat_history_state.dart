import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:equatable/equatable.dart';

class HeartBeatHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HeartBeatFirstLoadState extends HeartBeatHistoryState {}

class HeartBeatLoadingState extends HeartBeatHistoryState {}

// List<Map<String, dynamic>> data;
class HeartBeatDataloadedState extends HeartBeatHistoryState {
  List<HeartBeatTimedData> smallDataList, bigDataList;
  HeartBeatDataloadedState({
    required this.smallDataList,
    required this.bigDataList,
  });
  @override
  List<Object?> get props => [this.smallDataList, this.bigDataList];
}
