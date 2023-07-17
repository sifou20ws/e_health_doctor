import 'package:e_health_doctor/Presentation/Home/DashBoard/bloc/doc_dash_board_bloc.dart';
import 'package:e_health_doctor/Presentation/Home/Widgets/app_bar.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/blood_pressure_history/blood_pressure_history_screen.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/gluco_history/gluco_history_screen.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/heart_beat_history/heart_beat_history_screen.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/temperature_history/temperature_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:tab_container/tab_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatHistoryScreen extends StatefulWidget {
  final String patUid;

  PatHistoryScreen({required this.patUid});

  @override
  State<PatHistoryScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatHistoryScreen> {
  // final User? user = FirebaseAuth.instance.currentUser;
  // late DocDashBoardBloc _docDashBoardBloc;

  void initState() {
    super.initState();
    // _docDashBoardBloc = BlocProvider.of<DocDashBoardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Color(0xfff5f5f5),
          // centerTitle: true,
          title: Text(
            '💙 EHealth',
            style: TextStyle(
              color: Color(0xFF077bd7),
              fontSize: 30.sp,
              fontWeight: FontWeight.w900,
              letterSpacing: 3.sp,
            ),
          ),
          actions: [

          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            // color: Theme.of(context).colorScheme.secondary,
            // color: Color(0xfff5f5f5),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(11.sp, 0.sp, 11.sp, 20.sp),
            child: TabContainer(
              color: Color(0x5F49CAAE),
              // color: Theme.of(context).colorScheme.secondary,
              children: [
                TemperatureHistoryScreen(uid: widget.patUid),
                BloodPressureHistoryScreen(uid: widget.patUid),
                GlucoHistoryScreen(uid: widget.patUid),
                HeartBeatHistoryScreen(uid: widget.patUid),
              ],
              selectedTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
              unselectedTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              ),
              // isStringTabs: false,
              tabs: [
                'Temperature',
                'Blood Pressure',
                'Glucose',
                'Heart Beat',
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoBoxWidget extends StatelessWidget {
  const InfoBoxWidget(
      {required this.icon, required this.title, required this.value});

  final Widget icon;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22.69.sp, 17.53.sp, 18.7.sp, 30.sp),
      width: 160.sp,
      height: 140.sp,
      decoration: BoxDecoration(
        color: Color(0xfff5e1e9),
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Icon(
                Icons.more_horiz,
                size: 20.sp,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
              ),
              FittedBox(
                child: Text(
                  value,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
