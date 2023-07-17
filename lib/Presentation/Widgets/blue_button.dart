import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BlueButton extends StatelessWidget {
  const BlueButton({

    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.sp,
      height: 42.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3f51b5),
          // fixedSize: Size(400.sp, 62.sp),
          // minimumSize: Size(330.sp, 50.sp),
          // maximumSize:Size(330.sp, 50.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.sp),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              // height: 1.2175 * 1 / 1,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}