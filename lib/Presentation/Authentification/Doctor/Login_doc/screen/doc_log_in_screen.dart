import 'dart:developer';

import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/bloc/doc_log_in_bloc.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/pages/log_in_page.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/email_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/information_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late DocLogInBloc _docLogInBloc;

  @override
  void initState() {
    super.initState();
    _docLogInBloc = DocLogInBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _docLogInBloc,
      child: BlocListener<DocLogInBloc, DocLogInState>(
        listener: (context, state) {
          if(state.accStatus ==LoginAccStatus.success ){
            Navigator.pushReplacementNamed(context, '/Home');
          }
        },
        child: BlocBuilder<DocLogInBloc, DocLogInState>(
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    '💙 EHealth',
                                    style: TextStyle(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w700,
                                      // height: (1.2175 * 1 / 1),
                                      color: Color(0xff3f51b5),
                                    ),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(height: 20.sp),
                              LogInPage(),
                            ],
                          ),
                        ),
                        ResponsiveWrapper.of(context).isLargerThan(TABLET)
                            ? Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blue,
                                  ),
                                  // margin: EdgeInsets.all(20),
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(10.sp),
                                        child: Text(
                                          'Welcome to Ehealth',
                                          style: TextStyle(
                                              fontSize: 60.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}