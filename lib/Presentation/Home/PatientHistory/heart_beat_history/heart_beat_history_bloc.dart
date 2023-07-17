
import 'package:e_health_doctor/Presentation/Home/PatientHistory/heart_beat_history/heart_beat_history_event.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/heart_beat_history/heart_beat_history_state.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/GetDataServices.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartBeatHistoryBloc
    extends Bloc<HeartBeatHistoryEvent, HeartBeatHistoryState> {
  HeartBeatHistoryBloc() : super(HeartBeatFirstLoadState()) {
    on<HeartBeatLoadData>((event, emit) async {
      List<HeartBeatTimedData> smallList = [];

      List<Map<String, dynamic>> data;
      TimedData timedData;
      GetDataServices service = GetDataServices();
      data =
          await service.getMeasurementData(uid: event.uid, type: 'Heart beat');
      timedData = TimedData(data, DataField.heartBeat);
      DateTime dateTime = event.dateTime ?? timedData.heartBeat[0].timeStamp;

      if (event.selectedView == SelectedView.monthSelected)
        smallList = GraphService.heartBeatMonthData(
            bigList: TimedData(data, DataField.heartBeat), dateTime: dateTime);
      else if (event.selectedView == SelectedView.weeekSelected)
        smallList = GraphService.heartBeatMonthData(
            bigList: TimedData(data, DataField.heartBeat), dateTime: dateTime);
      else
        smallList = GraphService.heartBeatDayData(
            bigList: TimedData(data, DataField.heartBeat), dateTime: dateTime);
      for (int i = 0; i < smallList.length; i++) {
        // log(smallList[i].value.toString() +
        //     " - " +
        //     smallList[i].timeStamp.toString());
      }
      emit(HeartBeatDataloadedState(
          smallDataList: smallList, bigDataList: timedData.heartBeat));
    });
  }
}
