import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBlockWidget extends StatelessWidget {
  const DoctorBlockWidget(//nothing
      {required this.docName,
        required this.specialist,
        required this.hospital,
        required this.email,
        this.color = Colors.white,
        required this.onPressed});

  final String docName, specialist, hospital, email;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 0.sp, 20.sp),
        padding: EdgeInsets.fromLTRB(14.sp, 16.sp, 11.sp, 14.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 12.sp, 0.sp),
              width: 90.sp,
              height: 90.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Image.asset(
                  'assets/images/female_doc.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 0.sp, 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212427),
                    ),
                  ),
                  SizedBox(height: 9.sp),
                  Container(
                    margin: EdgeInsets.fromLTRB(3.sp, 0.sp, 0.sp, 19.75.sp),
                    width: 170.sp,
                    height: 0.25.sp,
                    decoration: BoxDecoration(
                      color: Color(0x7f212427),
                    ),
                  ),
                  Text(
                    specialist,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      // height: 1.2.sp,
                      color: Color(0xff212427),
                    ),
                  ),
                  Row(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 6.5.sp, 1.sp),
                      //   width: 0.5.sp,
                      //   height: 10.sp,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xff000000),
                      //   ),
                      // ),
                      Text(
                        hospital,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff212427),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      // height: 1.2.sp/fem,
                      color: Color(0xff212427),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}