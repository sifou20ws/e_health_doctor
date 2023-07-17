import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatProfileWidget extends StatelessWidget {
  const PatProfileWidget(
      {required this.age,
      required this.weight,
      required this.blood,
      required this.sex,
      required this.name});
  final String age, weight, blood, sex, name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 0.sp, 20.sp),
      width: 330.sp,
      height: 128.sp,
      decoration: BoxDecoration(
        color: Color(0x332196f3),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 130.sp,
              height: 128.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.sp),
                  bottomLeft: Radius.circular(15.sp),
                ),
                child: Image.asset(
                  'assets/images/female_doc.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 6,
            child: Container(
              width: 130.sp,
              height: 128.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.218999958.sp,
                          color: Color(0xff212427),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TitleAndText(title: 'Age', text: age),
                  SizedBox(height: 1.sp),
                  TitleAndText(title: 'Weight', text: weight),
                  SizedBox(height: 1.sp),
                  TitleAndText(title: 'Blood type', text: blood),
                  SizedBox(height: 1.sp),
                  TitleAndText(title: 'Sex', text: sex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAndText extends StatelessWidget {
  TitleAndText({required this.title, required this.text});
  final String title, text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title + ' ',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff0c1115),
            ),
          ),
          TextSpan(
            text: ': ',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff0c1115),
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff0c1115),
            ),
          ),
        ],
      ),
    );
  }
}
