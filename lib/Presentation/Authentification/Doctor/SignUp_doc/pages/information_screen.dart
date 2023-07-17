import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:e_health_doctor/Presentation/Widgets/blue_button.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SignUpInfoScreen extends StatefulWidget {
  const SignUpInfoScreen({Key? key}) : super(key: key);

  @override
  State<SignUpInfoScreen> createState() => _SignUpInfoScreenState();
}

class _SignUpInfoScreenState extends State<SignUpInfoScreen> {
  late DocSignUpBloc _docSignUpBloc;
  List<String> gender = <String>['Male', 'Female'];

  String? selected = null, selected2 = null;
  @override
  void initState() {
    super.initState();
    _docSignUpBloc = BlocProvider.of<DocSignUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fill Your Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(height: 25.sp),
            CostumeTextField(
              title: 'Full Name',
              hintText: 'Enter Your Full Name',
              onChanged: (String value) {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocSignFullNameEvent(fullName: value));
              },
            ),
            SizedBox(height: 15.sp),
            CustomDropDownMenu(
              title: 'Gender*',
              selectedValue: selected2,
              list: gender,
              hint: 'Select Your Gender',
              onChanged: (String? value) {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocSignGenderEvent(gender: value!));
                setState(() {
                  selected2 = value;
                });
              },
            ),
            SizedBox(height: 15.sp),
            CostumeTextField(
              title: 'Specialty',
              hintText: 'Enter Your Specialty',
              onChanged: (String value) {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocSignSpecialtyEvent(specialty: value));
              },
            ),
            SizedBox(height: 15.sp),
            CostumeTextField(
              title: 'Hospital Name',
              hintText: 'Enter Your Hospital Name',
              onChanged: (String value) {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocSignHosNameEvent(hosName: value));
              },
            ),
            SizedBox(height: 15.sp),
            CostumeTextField(
              title: 'Hospital Address',
              hintText: 'Enter Your Hospital Address',
              onChanged: (String value) {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocSignHosAddressEvent(hosAddress: value));
              },
            ),
            SizedBox(height: 20.sp),
            (_docSignUpBloc.state.accStatus != CreateAccStatus.loading)
                ? BlueButton(
                    title: 'Sign Up',
                    onPressed: () {
                      BlocProvider.of<DocSignUpBloc>(context)
                          .add(DocCreateAccountEvent());
                    },
                  )
                : Container(
                    width: 400.sp,
                    height: 42.sp,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3f51b5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                      ),
                      child: Lottie.asset(
                        'assets/lottie/loading-green.json',
                        height: 100,
                        frameRate: FrameRate(120),
                      ),
                    ),
                  ),
            SizedBox(height: 10.sp),
            BorderedButton(
              onPressed: () {
                BlocProvider.of<DocSignUpBloc>(context)
                    .add(DocChangePageEvent(page: 0));
              },
              title: 'Previous',
            ),
          ],
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  const BorderedButton({
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
          backgroundColor: Color(0xfff5f5f5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.sp),
          ),
          side: const BorderSide(
            width: 2.0,
            color: Color(0xFF000B30),
          ),
        ),
        child: Center(
          child: Text(
            'Previous',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              // height: 1.2175 * 1 / 1,
              color: Color(0xff000B30),
            ),
          ),
        ),
      ),
    );
  }
}
