import 'package:e_health_doctor/Presentation/Home/PatientHistory/widgets/select_butt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphController extends StatelessWidget {
  DateTime actualDateTime;
  Function next, previous;
  GraphController(
      {super.key,
      required this.actualDateTime,
      required this.next,
      required this.previous});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TransButtonIcon(
          icon: Icons.arrow_back_ios_new,
          onTab: () {
            previous();
          },
          size: 20.sp,
        ),
        SizedBox(
          width: 15.sp,
        ),
        Text(
          "${actualDateTime.year} - ${actualDateTime.month} - ${actualDateTime.day}",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 15.sp,
        ),
        TransButtonIcon(
          icon: Icons.arrow_forward_ios,
          onTab: () {
            next();
          },
          size: 20.sp,
        ),
      ],
    );
  }
}
