import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/screen/doc_log_in_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/email_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/pages/information_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/screen/doc_sign_up_screen.dart';
import 'package:e_health_doctor/Presentation/Home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  //nothing
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        // '/': (context) => LoadingScreen(),

        '/signUp': ((context) => SignUpScreen()),
        '/signUp/info': ((context) => SignUpInfoScreen()),
        '/signUp/email': ((context) => SignUpEmailScreen()),
        '/signIn': ((context) => SignInScreen()),
        '/Home': ((context) => HomeScreen()),
      };
}
