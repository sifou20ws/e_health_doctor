import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/bloc/doc_log_in_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:e_health_doctor/Presentation/Widgets/blue_button.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late DocLogInBloc _logInBloc;

  @override
  void initState() {
    super.initState();
    _logInBloc = BlocProvider.of<DocLogInBloc>(context);
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
                      'Login to your account',
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
                        _logInBloc.add(DocSignEmailEvent(email: value));
                      },
                      hintText: 'your@email.com',
                    ),
                    SizedBox(height: 26.sp),
                    CostumeTextField(
                      title: 'Password*',
                      onChanged: (String value) {
                        _logInBloc.add(DocSignPasswordEvent(password: value));
                      },
                      hintText: 'Enter your password',
                      suffixIcon: GestureDetector(
                        onTap: (() {
                          log('message');
                        }),
                        child: Icon(
                          FontAwesomeIcons.eye,
                          size: 15.sp,
                        ),
                      ),
                      hide: true,
                    ),
                    SizedBox(height: 26.sp),
                    (_logInBloc.state.accStatus != LoginAccStatus.loading)
                        ? BlueButton(
                            title: 'Login',
                            onPressed: () {
                              _logInBloc.add(LoginEvent());
                              // Navigator.pushReplacementNamed(context, '/Home');
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
                  ],
                ),
              ],
            ),
            BottomText(
              text1: 'Don\'t have an account? ',
              text2: 'Sign up',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signUp');
              },
            ),
          ],
        ),
      ),
    );
  }
}
