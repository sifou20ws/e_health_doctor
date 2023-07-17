import 'dart:developer';

import 'package:e_health_doctor/Presentation/Models/critical_values.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HistoryDataRow extends StatelessWidget {
  dynamic timedData;
  bool anomaly = false;
  HistoryDataRow({
    super.key,
    required this.timedData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                DateFormat("dd MMM yyyy - HH:mm")
                    .format(timedData.timeStamp),
                style: TextStyle(
                  color: Color(0x8F0F0F0F),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 20.sp),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: timedData is BloodPressureTimedData
                      ? timedData.systolicPressure.toString() +
                          ' / ' +
                          timedData.diastolicPressure.toString()
                      : timedData.value.toString(),
                  style: TextStyle(
                    color: Color(0x8F0F0F0F),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: timedData is GlucoseTimedData
                          ? " mg/dL"
                          : timedData is TemperatureTimedData
                              ? " °C"
                              : timedData is HeartBeatTimedData
                                  ? " bpm"
                                  : timedData is BloodPressureTimedData
                                      ? " mmHg"
                                      : "",
                      style: TextStyle(
                        color: Color(0x8F0F0F0F),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: CriticalValues.isAnomaly(timedData) == -1
                            ? Color(0x8F0F0FFF)
                            : CriticalValues.isAnomaly(timedData) == 1
                                ? Color(0x8FFF0F0F)
                                : Color(0x00),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryNumericDataField extends StatelessWidget {
  List<dynamic> dataList;
  HistoryNumericDataField({super.key, required this.dataList});

  List<Widget> historyNumericDataRows({
    required List<dynamic> dataList,
  }) {
    List<Widget> historyOneNumericRowsList = [];
    for (int i = dataList.length - 1; i >= 0; i--) {
      historyOneNumericRowsList.add(
        HistoryDataRow(
          timedData: dataList[i],
        ),
      );
    }
    return historyOneNumericRowsList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: historyNumericDataRows(dataList: dataList),
        ),
      ],
    );
  }
}
