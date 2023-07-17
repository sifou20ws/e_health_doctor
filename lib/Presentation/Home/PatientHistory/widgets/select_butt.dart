import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class TransButtonText extends StatelessWidget {
  String lable;
  Color? baseColor;
  Color _buttColorOff = Color(0x4F2F2F2F);
  Color _buttColorOffL = Color(0x1F2F2F2F);
  Color _buttColorOn = Color(0x9F49CAAE);
  Color _buttColorOnL = Color(0x3F49CAAE);
  Function onTab;
  bool state;
  TransButtonText({
    super.key,
    required this.lable,
    this.state = true,
    required this.onTab,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    _buttColorOn = baseColor ?? Color(0x9F49CAAE);
    _buttColorOnL =
        baseColor?.withOpacity(baseColor!.opacity / 5) ?? Color(0x3F49CAAE);
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        alignment: Alignment.center,
        height: 20.sp,
        width: lable.length.toDouble() * 6 + 30.sp,
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
                color: state ? _buttColorOn : _buttColorOff,
                fontSize: 11.sp,
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
    _buttColor = baseColor ?? Color(0x9F49CAAE);
    _buttColorL =
        baseColor?.withOpacity(baseColor!.opacity / 2) ?? Color(0x3F49CAAE);
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        // alignment: Alignment.center,
        height: this.size ?? 23,
        width: this.size ?? 23,
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
