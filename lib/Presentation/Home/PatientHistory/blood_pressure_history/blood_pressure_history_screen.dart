import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_bloc.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_event.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_state.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/data_scroll.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/history_graph.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BloodPressureHistoryScreen extends StatefulWidget {
  const BloodPressureHistoryScreen({required this.uid});
  final String uid;

  @override
  State<BloodPressureHistoryScreen> createState() =>
      _BloodPressureHistoryScreenState();
}

class _BloodPressureHistoryScreenState
    extends State<BloodPressureHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  SelectedView selectedView = SelectedView.daySelected;
  DateTime dateTime = DateTime.now();
  List<BloodPressureTimedData> smallList = [], bigList = [];
  static const Duration oneMonth = Duration(days: 30),
      oneDay = Duration(days: 1),
      oneWeek = Duration(days: 7);
  bool isSystoVisible = true, isDiastoVisible = true;
  @override
  Widget build(BuildContext context) {
    bool table = false;
    return BlocProvider(
      create: (context) => BloodPressureHistoryBloc(),
      child: BlocBuilder<BloodPressureHistoryBloc, BloodPressureHistoryState>(
        builder: (context, state) {
          if (state is BloodPressureFirstLoadState) {
            context.read<BloodPressureHistoryBloc>().add(BloodPressureLoadData(
                uid: widget.uid, selectedView: selectedView));
          }
          if (state is BloodPressureDataloadedState) {
            bigList = state.bigDataList;
            smallList = state.smallDataList;
          }
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
              child: state is BloodPressureFirstLoadState
                  ? Container(
                      height: 700,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/lottie/loading-green.json',
                        height: 70.sp,
                        frameRate: FrameRate(100),
                        repeat: false,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: HistoryDataGraph(
                            dataList: smallList,
                            selectedView: selectedView,
                            dayTab: () {
                              selectedView = SelectedView.daySelected;

                              context.read<BloodPressureHistoryBloc>().add(
                                  BloodPressureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            monthTab: () {
                              selectedView = SelectedView.monthSelected;
                              context.read<BloodPressureHistoryBloc>().add(
                                  BloodPressureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            weekTab: () {
                              selectedView = SelectedView.weeekSelected;
                              context.read<BloodPressureHistoryBloc>().add(
                                    BloodPressureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime,
                                    ),
                                  );
                            },
                            actualDateTime: dateTime,
                            next: () {
                              if (selectedView == SelectedView.monthSelected)
                                dateTime = dateTime.add(oneMonth);
                              else if (selectedView ==
                                  SelectedView.weeekSelected)
                                dateTime = dateTime.add(oneWeek);
                              else
                                dateTime = dateTime.add(oneDay);
                              context.read<BloodPressureHistoryBloc>().add(
                                  BloodPressureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            previous: () {
                              if (selectedView == SelectedView.monthSelected)
                                dateTime = dateTime.subtract(oneMonth);
                              else if (selectedView ==
                                  SelectedView.weeekSelected)
                                dateTime = dateTime.subtract(oneWeek);
                              else
                                dateTime = dateTime.subtract(oneDay);
                              context.read<BloodPressureHistoryBloc>().add(
                                  BloodPressureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            isDiastoVisible: isDiastoVisible,
                            isSystoVisible: isSystoVisible,
                            onDiastoTab: () {
                              isDiastoVisible = !isDiastoVisible;
                              setState(() {});
                            },
                            onSystoTab: () {
                              isSystoVisible = !isSystoVisible;
                              setState(() {});
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: HistoryNumericDataField(
                              dataList: bigList,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
