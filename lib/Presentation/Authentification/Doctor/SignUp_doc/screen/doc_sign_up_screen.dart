import 'dart:developer';

import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/email_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/information_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late DocSignUpBloc _docSignUpBloc;

  @override
  void initState() {
    super.initState();
    _docSignUpBloc = DocSignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _docSignUpBloc,
      child: BlocListener<DocSignUpBloc, DocSignUpState>(
        listener: (context, state) {},
        child: BlocBuilder<DocSignUpBloc, DocSignUpState>(
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 28 * 1),
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
                                  margin: EdgeInsets.only(top: 20 ),
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
                              (state.page == 0) ? SignUpEmailScreen() : SignUpInfoScreen(),
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
                                    child: Text(
                                      'Welcome to Ehealth',
                                      style: TextStyle(
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
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

/** ***********************/
// import 'dart:developer';
//
// import 'package:e_health_doctor/Presentation/Widgets/blue_button.dart';
// import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/buttom_text.dart';
// import 'package:e_health_doctor/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
// import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class DocEmailScreen extends StatefulWidget {
//   const DocEmailScreen();
//
//   @override
//   State<DocEmailScreen> createState() => _DocEmailScreenState();
// }
//
// class _DocEmailScreenState extends State<DocEmailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 390;
//     // double 1 = MediaQuery.of(context).size.width / baseWidth;
//     // double 1 = 1 * 0.97;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           // padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 28 * 1),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             color: Color(0xfff5f5f5),
//             image: DecorationImage(
//               image: AssetImage('assets/images/background.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             margin: EdgeInsets.all(30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Align(
//                         child: Container(
//                           margin: EdgeInsets.only(top: 20 ),
//                           child: Text(
//                             '💙 EHealth',
//                             style: TextStyle(
//                               fontSize: 40.sp,
//                               fontWeight: FontWeight.w700,
//                               // height: (1.2175 * 1 / 1),
//                               color: Color(0xff3f51b5),
//                             ),
//                           ),
//                         ),
//                         alignment: Alignment.topLeft,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'Create your account',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xff000000),
//                                 ),
//                               ),
//                               SizedBox(height: 40.sp),
//
//                               CostumeTextField(
//                                 title: 'Email*',
//                                 onChanged: (String value) {
//                                   BlocProvider.of<DocSignUpBloc>(context)
//                                       .add(DocSignEmailEvent(email: value));
//                                 },
//                                 hintText: 'your@email.com',
//                               ),
//                               SizedBox(height: 26.sp),
//                               CostumeTextField(
//                                 title: 'Password*',
//                                 onChanged: (String value) {
//                                   BlocProvider.of<DocSignUpBloc>(context)
//                                       .add(DocSignPasswordEvent(password: value));
//                                 },
//                                 hintText: 'Enter your password',
//                                 suffixIcon: GestureDetector(
//                                   onTap: (() {
//                                     log('message');
//                                   }),
//                                   child: Icon(FontAwesomeIcons.eye , size: 15.sp,),
//                                 ),
//                                 hide: true,
//                               ),
//                               SizedBox(height: 26.sp),
//
//                               BlueButton(
//                                 title: 'Sign Up',
//                                 onPressed: () {
//                                   // Navigator.pushNamed(context, '/pat/signUp/info');
//                                   BlocProvider.of<DocSignUpBloc>(context)
//                                       .add(DocChangePageEvent(page: 1));
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       BottomText(
//                         text1: 'Already have an account? ',
//                         text2: 'Sign in',
//                         onPressed: () {
//                           // Navigator.pushReplacementNamed(
//                           //     context, '/pat/signIn');
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
