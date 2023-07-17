import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InfoBoxWidget extends StatelessWidget {
  const InfoBoxWidget(
      {required this.icon, required this.title, required this.value});
  final Widget icon;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool webView = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return Container(
      padding: webView
          ? EdgeInsets.fromLTRB(15.sp, 10.sp, 15.sp, 10.sp)
          : EdgeInsets.fromLTRB(7.sp, 5.sp, 7.sp, 5.sp),
      width: webView ? screenSize.width / 5 : screenSize.width / 4,
      height: webView ? 120.sp : 150.sp,
      decoration: BoxDecoration(
        color: Color(0xfff5e1e9),
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: FittedBox(fit: BoxFit.cover, child: icon),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: webView ? EdgeInsets.all(5.sp): EdgeInsets.all(5.sp),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: Text(
          //       'See more ->',
          //       style: TextStyle(fontSize: 14.sp, color: Colors.blue),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
