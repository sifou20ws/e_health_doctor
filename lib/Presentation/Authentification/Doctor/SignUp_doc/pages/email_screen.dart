import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:e_health_doctor/Presentation/Widgets/blue_button.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  late DocSignUpBloc _docSignUpBloc;

@override
  void initState() {
    super.initState();
    _docSignUpBloc =BlocProvider.of<DocSignUpBloc>(context);
}
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Create your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 40.sp),
                    CostumeTextField(
                      title: 'Email*',
                      onChanged: (String value) {
                        BlocProvider.of<DocSignUpBloc>(context)
                            .add(DocSignEmailEvent(email: value));
                      },
                      hintText: 'your@email.com',
                    ),
                    SizedBox(height: 26.sp),
                    CostumeTextField(
                      title: 'Password*',
                      onChanged: (String value) {
                        BlocProvider.of<DocSignUpBloc>(context)
                            .add(DocSignPasswordEvent(password: value));
                      },
                      hintText: 'Enter your password',
                      suffixIcon: GestureDetector(
                        onTap: (() {
                          log('message');
                        }),
                        child: Icon(FontAwesomeIcons.eye , size: 15.sp,),
                      ),
                      hide: true,
                    ),
                    SizedBox(height: 26.sp),

                    BlueButton(
                      title: 'Sign Up',
                      onPressed: () {
                        BlocProvider.of<DocSignUpBloc>(context)
                            .add(DocChangePageEvent(page: 1));

                      },
                    ),
                  ],
                ),
              ],
            ),
            BottomText(
              text1: 'Already have an account? ',
              text2: 'Sign in',
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/signIn');
              },
            ),
          ],
        ),
      ),
    );
  }
}
