import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_bloc.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_event.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_state.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/data_scroll.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/history_graph.dart';
import 'package:e_health_doctor/Presentation/Models/data_enums.dart';
import 'package:e_health_doctor/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class TemperatureHistoryScreen extends StatefulWidget {
  const TemperatureHistoryScreen({required this.uid});
  final String uid;

  @override
  State<TemperatureHistoryScreen> createState() =>
      _TemperatureHistoryScreenState();
}

class _TemperatureHistoryScreenState extends State<TemperatureHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  SelectedView selectedView = SelectedView.daySelected;
  DateTime dateTime = DateTime.now();
  List<TemperatureTimedData> smallList = [], bigList = [];
  static const Duration oneMonth = Duration(days: 30),
      oneDay = Duration(days: 1),
      oneWeek = Duration(days: 7);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TemperatureHistoryBloc(),
      child: BlocBuilder<TemperatureHistoryBloc, TemperatureHistoryState>(
        builder: (context, state) {
          if (state is TemperatureFirstLoadState) {
            context.read<TemperatureHistoryBloc>().add(TemperatureLoadData(
                uid: widget.uid, selectedView: selectedView));
          }
          if (state is TemperatureDataLoadedState) {
            bigList = state.bigDataList;
            smallList = state.smallDataList;
          }
          return Padding(
            padding: EdgeInsets.all(8.sp),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8.sp),
              child: state is TemperatureFirstLoadState
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

                              context.read<TemperatureHistoryBloc>().add(
                                  TemperatureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            monthTab: () {
                              selectedView = SelectedView.monthSelected;
                              context.read<TemperatureHistoryBloc>().add(
                                  TemperatureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            weekTab: () {
                              selectedView = SelectedView.weeekSelected;
                              context.read<TemperatureHistoryBloc>().add(
                                    TemperatureLoadData(
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
                              context.read<TemperatureHistoryBloc>().add(
                                  TemperatureLoadData(
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
                              context.read<TemperatureHistoryBloc>().add(
                                  TemperatureLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
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
