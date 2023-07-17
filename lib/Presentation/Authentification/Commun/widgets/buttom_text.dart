import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    required this.text1,
    required this.text2,
    required this.onPressed,
  });
  final String text1, text2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xff666D83),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff2196f3),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}