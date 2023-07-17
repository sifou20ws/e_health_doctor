import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostumeTextField extends StatelessWidget {
  const CostumeTextField({
    required this.hintText,
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.hide = false,
    this.enabled = true,
    this.small = false,
    required this.title,
    required this.onChanged,
  });
  final String hintText, title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hide, enabled, small;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.sp),
        Container(
          // margin: EdgeInsets.fromLTRB(0, 0, 3.sp, 0),
          // padding: EdgeInsets.fromLTRB(14.sp, 10.sp, 14.sp, 10.sp),
          width: small ? 140.sp : 400.sp,
          height: 42.sp,
          child: TextField(
            onChanged: onChanged,
            enabled: enabled,
            obscureText: hide,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 17.sp),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffE1E1E1),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.sp),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.sp),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.sp),
                borderSide: BorderSide(
                    color: Color.fromARGB(100, 33, 150, 243), width: 2.sp),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xff9499A8), fontSize: 14.sp),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
