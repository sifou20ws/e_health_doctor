import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocInfoWidget extends StatelessWidget {
  DocInfoWidget(
      {required this.image,
      required this.name,
      required this.gender,
      required this.specialist,
      required this.hosName,
      required this.hosAddr,
      required this.email});

  String image, name, gender, specialist, hosName, hosAddr, email;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20.sp),
      padding: EdgeInsets.all(20.sp),
      height: screenSize.height / 2.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xfff5e1e9),
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(top: 10.sp),
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        image,
                        scale: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.sp,
                      bottom: 15.sp,
                      right: 10.sp,
                    ),
                    child: ListTile(
                      title: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 50.sp,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        gender,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumText(text: specialist),
                CostumText(text: hosName),
                CostumText(text: hosAddr),
                CostumText(text: email),
              ],
            ),

          ),
        ],
      ),
    );
  }
}

class CostumText extends StatelessWidget {
  CostumText({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Text(
        text+' ',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          // fontSize: 20.sp,
        ),
      ),
    );
  }
}
