import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/graph_controller.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/select_butt.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryDataGraph extends StatelessWidget {
  List<GlucoseTimedData> glucoDataList = [];
  List<TemperatureTimedData> temperatureDataList = [];
  List<dynamic> dataList = [];
  Function dayTab, monthTab, weekTab ;
  Function? onSystoTab, onDiastoTab;
  SelectedView selectedView;
  DateTime actualDateTime;
  Function next, previous;
  bool isDiastoVisible = true, isSystoVisible = true;
  HistoryDataGraph({
    super.key,
    required this.dataList,
    required this.selectedView,
    required this.dayTab,
    required this.monthTab,
    required this.weekTab,
    required this.actualDateTime,
    required this.next,
    required this.previous,
    bool? isDiastoVisible,
    bool? isSystoVisible,
    this.onDiastoTab,
    this.onSystoTab,
  }) {
    this.isDiastoVisible = isDiastoVisible ?? true;
    this.isSystoVisible = isSystoVisible ?? true;
  }

  List<ScatterSeries<dynamic, DateTime>> oneValueDotSeries() {
    return [
      ScatterSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        animationDuration: 500,
        color: Colors.amber,
        markerSettings: MarkerSettings(
          width: 8.sp,
          height: 8.sp,
        ),
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(
            color: Color(0xFF6F6F6F),
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ),
    ];
  }

  List<XyDataSeries<dynamic, DateTime>> oneValueLineSeries() {
    return <XyDataSeries<dynamic, DateTime>>[
      LineSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        color: Color(0x9F49CAAE),
      ),
      AreaSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        color: Color(0xFF49CAAE),
        gradient: LinearGradient(
          colors: [Color(0x4F49CAAE), Color(0x0Fffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ];
  }

  List<ScatterSeries<BloodPressureTimedData, DateTime>>
      bloodPressureDotSeries() {
    return [
      ScatterSeries<BloodPressureTimedData, DateTime>(
        isVisible: isDiastoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.diastolicPressure,
        animationDuration: 500,
        color: Colors.amber,
        markerSettings: MarkerSettings(
          width: 8.sp,
          height: 8.sp,
        ),
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(
            color: Color(0xFF6F6F6F),
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ),
      ScatterSeries<BloodPressureTimedData, DateTime>(
        isVisible: isSystoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.systolicPressure,
        animationDuration: 500,
        color: Color(0x9F49CAAE),
        markerSettings: MarkerSettings(
          width: 8.sp,
          height: 8.sp,
        ),
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(
            color: Color(0xFF6F6F6F),
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ),
    ];
  }

  List<XyDataSeries<BloodPressureTimedData, DateTime>>
      bloodPressureLineSeries() {
    return <XyDataSeries<BloodPressureTimedData, DateTime>>[
      LineSeries<BloodPressureTimedData, DateTime>(
        isVisible: isSystoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.systolicPressure,
        color: Color(0x9F49CAAE),
      ),
      AreaSeries<BloodPressureTimedData, DateTime>(
        isVisible: isSystoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.systolicPressure,
        color: Color(0xFF49CAAE),
        gradient: LinearGradient(
          colors: [Color(0x4F49CAAE), Color(0x0Fffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      LineSeries<BloodPressureTimedData, DateTime>(
        isVisible: isDiastoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.diastolicPressure,
        color: Colors.amber,
      ),
      AreaSeries<BloodPressureTimedData, DateTime>(
        isVisible: isDiastoVisible,
        dataSource: dataList as List<BloodPressureTimedData>,
        xValueMapper: (BloodPressureTimedData values, _) => values.timeStamp,
        yValueMapper: (BloodPressureTimedData values, _) =>
            values.diastolicPressure,
        color: Colors.amber,
        gradient: LinearGradient(
          colors: [Colors.amber.withOpacity(0.3), Color(0x0Fffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double minValue = 30, maxValue = 140;
    if (dataList.length > 1) {
      maxValue = GraphService.maxValue(dataList);
      minValue = GraphService.minValue(dataList);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      height: MediaQuery.of(context).size.height*0.8,
      color: Color(0x00f5f5f5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 10.sp),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TransButtonText(
                      lable: 'Day',
                      onTab: () {
                        dayTab();
                      },
                      state: selectedView == SelectedView.daySelected,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    TransButtonText(
                      lable: 'Week',
                      onTab: () {
                        weekTab();
                      },
                      state: selectedView == SelectedView.weeekSelected,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    TransButtonText(
                      lable: 'Month',
                      onTab: () {
                        monthTab();
                      },
                      state: selectedView == SelectedView.monthSelected,
                    ),
                  ],
                ),
                dataList is List<BloodPressureTimedData>
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TransButtonText(
                            lable: 'Diastolic',
                            baseColor: Colors.amber,
                            onTab: () {
                              onDiastoTab!();
                            },
                            state: isDiastoVisible,
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          TransButtonText(
                            lable: 'Systolic',
                            onTab: () {
                              onSystoTab!();
                            },
                            state: isSystoVisible,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          // SizedBox(height: 10.sp),
          Expanded(
            flex: 5,
            child: SfCartesianChart(
              backgroundColor: Color(0x00f5f5f5),
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              // Initialize category axis
              primaryXAxis: DateTimeAxis(
                intervalType: selectedView == SelectedView.daySelected
                    ? DateTimeIntervalType.auto
                    : DateTimeIntervalType.days,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x00000000),
                ),
                rangePadding: selectedView == SelectedView.daySelected
                    ? ChartRangePadding.additional
                    : ChartRangePadding.auto,
                labelStyle: TextStyle(fontSize: 10.sp),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(fontSize: 10.sp),

                // interval: 10,
                minimum: minValue - 10,
                maximum: maxValue + 10,
                // maximum: 130,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x0F000000),
                ),
              ),
              // primaryXAxis: CategoryAxis(),
              series: selectedView == SelectedView.daySelected
                  ? dataList is List<BloodPressureTimedData>
                      ? bloodPressureDotSeries()
                      : oneValueDotSeries()
                  : dataList is List<BloodPressureTimedData>
                      ? bloodPressureLineSeries()
                      : oneValueLineSeries(),
            ),
          ),
          // SizedBox(height: 5.sp),
          Expanded(
            flex: 1,
            child: GraphController(
              actualDateTime: this.actualDateTime,
              next: () {
                next();
              },
              previous: () {
                previous();
              },
            ),
          ),
        ],
      ),
    );
  }
}
