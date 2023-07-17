import 'dart:developer';

import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_event.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_state.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/GetDataServices.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodPressureHistoryBloc
    extends Bloc<BloodPressureHistoryEvent, BloodPressureHistoryState> {
  BloodPressureHistoryBloc() : super(BloodPressureFirstLoadState()) {
    on<BloodPressureLoadData>((event, emit) async {
      List<BloodPressureTimedData> smallList = [];

      emit(BloodPressureLoadingState());
      List<Map<String, dynamic>> data;
      TimedData timedData;
      GetDataServices service = GetDataServices();
      data = await service.getMeasurementData(
          uid: event.uid, type: 'Blood Pressure');
      timedData = TimedData(data, DataField.bloodPressure);
      DateTime dateTime =
          event.dateTime ?? timedData.bloodPressure[0].timeStamp;

      if (event.selectedView == SelectedView.monthSelected)
        smallList = GraphService.bloodPressureMonthData(
            bigList: TimedData(data, DataField.bloodPressure),
            dateTime: dateTime);
      else if (event.selectedView == SelectedView.weeekSelected)
        smallList = GraphService.bloodPressureMonthData(
            bigList: TimedData(data, DataField.bloodPressure),
            dateTime: dateTime);
      else
        smallList = GraphService.bloodPressureDayData(
            bigList: TimedData(data, DataField.bloodPressure),
            dateTime: dateTime);
      for (int i = 0; i < smallList.length; i++) {
        // log(smallList[i].value.toString() +
        //     " - " +
        //     smallList[i].timeStamp.toString());
      }
      emit(BloodPressureDataloadedState(
          smallDataList: smallList, bigDataList: timedData.bloodPressure));
    });
  }
}
