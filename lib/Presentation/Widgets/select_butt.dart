import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

//ignore: must_be_immutable
class TransButtonText extends StatelessWidget {
  String lable;
  Color _buttColorOff = Color(0x4F2F2F2F);
  Color _buttColorOffL = Color(0x1F2F2F2F);
  Color _buttColorOn = Color(0x9F49CAAE);
  Color _buttColorOnL = Color(0x3F49CAAE);
  Function onTab;
  bool state;
  TransButtonText({
    required this.lable,
    this.state = true,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool webView = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        alignment: Alignment.center,
        // height: screenSize.height * 0.1,
        height: webView ? screenSize.height * 0.08 :screenSize.height * 0.05  ,
        width: screenSize.width * 0.1,
        decoration: BoxDecoration(
          color: state ? _buttColorOnL : _buttColorOffL,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: state ? _buttColorOn : _buttColorOff,
              width: 1.sp,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                // color: state ? _buttColorOn : _buttColorOff,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      onTap: () {
        onTab();
      },
    );
  }
}

class TransButtonIcon extends StatelessWidget {
  IconData icon;
  double? size, iconSize;
  Color? baseColor;
  Color _buttColor = Color(0x9F49CAAE);
  Color _buttColorL = Color(0x3F49CAAE);
  Function onTab;
  TransButtonIcon({
    super.key,
    required this.icon,
    required this.onTab,
    this.size,
    this.baseColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool webView = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    _buttColor = baseColor ?? Color(0x9F49CAAE);
    _buttColorL =
        baseColor?.withOpacity(baseColor!.opacity / 2) ?? Color(0x3F49CAAE);
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        // alignment: Alignment.center,
        height: this.size ?? 23,
        width: this.size ?? 23,
        // height: webView ? screenSize.height * 0.1 :screenSize.height * 0.01  ,
        // height: 10.sp,
        decoration: BoxDecoration(
          color: _buttColorL,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: _buttColor,
              width: 1,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize ?? ((this.size ?? 23) - 5),
            color: _buttColor,
          ),
        ),
      ),
      onTap: () {
        onTab();
      },
    );
  }
}
