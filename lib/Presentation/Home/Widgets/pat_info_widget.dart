import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientInfoBox extends StatelessWidget {
  const PatientInfoBox({
    required this.webView,
    required this.screenSize,
    required this.name,
    required this.age,
    required this.gender,
    required this.blood,
    required this.address,
    required this.email,
    required this.phone,
  });

  final bool webView;
  final Size screenSize;
  final String name, age, gender, blood, address, email, phone;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfff5e1e9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.sp),
      ),
      margin: EdgeInsets.all(20.sp),
      child: Container(
        padding: EdgeInsets.all(20.sp),
        // height: webView ? screenSize.height / 3 : screenSize.height / 8,
        width: webView ? screenSize.width / 3.4 : screenSize.width / 1.2,
        decoration: BoxDecoration(
          color: Color(0xfff5e1e9),
          borderRadius: BorderRadius.circular(24.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.sp),
                    child: Image.asset(
                      'assets/images/female_doc.jpg',
                      scale: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      top: 15.sp,
                      bottom: 15.sp,
                      right: 20.sp,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.sp),
            FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumText(
                    title: 'Age',
                    text: age,
                    optional: 'Years old, ' + gender,
                  ),
                  CostumText(title: 'Blood', text: blood),
                  CostumText(title: 'Address', text: address),
                  CostumText(title: 'Email', text: email),
                  CostumText(title: 'Phone', text: phone),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'See more ->',
                  style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CostumText extends StatelessWidget {
  CostumText({required this.text, required this.title, this.optional = ''});
  String title, text, optional;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Row(
        children: [
          Text(
            title + ': ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              // fontSize: 20.sp,
            ),
          ),
          Text(
            text + ' ',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              // fontSize: 20.sp,
            ),
          ),
          Text(
            optional,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              // fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
