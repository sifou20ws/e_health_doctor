import 'dart:developer';

import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_event.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_state.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/GetDataServices.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureHistoryBloc
    extends Bloc<TemperatureHistoryEvent, TemperatureHistoryState> {
  TemperatureHistoryBloc() : super(TemperatureFirstLoadState()) {
    on<TemperatureLoadData>((event, emit) async {
      List<TemperatureTimedData> smallList = [];

      emit(TemperatureLoadingState());
      List<Map<String, dynamic>> data;
      TimedData timedData;
      GetDataServices service = GetDataServices();
      data =
          await service.getMeasurementData(uid: event.uid, type: 'Temperature');
      timedData = TimedData(data, DataField.temperature);
      DateTime dateTime = event.dateTime ?? timedData.temperature[0].timeStamp;

      if (event.selectedView == SelectedView.monthSelected)
        smallList = GraphService.temperatureMonthData(
            bigList: TimedData(data, DataField.temperature),
            dateTime: dateTime);
      else if (event.selectedView == SelectedView.weeekSelected)
        smallList = GraphService.temperatureMonthData(
            bigList: TimedData(data, DataField.temperature),
            dateTime: dateTime);
      else
        smallList = GraphService.temperatureDayData(
            bigList: TimedData(data, DataField.temperature),
            dateTime: dateTime);
      for (int i = 0; i < smallList.length; i++) {
        // log(smallList[i].value.toString() +
        //     " - " +
        //     smallList[i].timeStamp.toString());
      }
      emit(TemperatureDataLoadedState(
          smallDataList: smallList, bigDataList: timedData.temperature));
    });
  }
}
