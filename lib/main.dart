import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/pages/log_in_page.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/Login_doc/screen/doc_log_in_screen.dart';
import 'package:e_health_doctor/Presentation/Authentification/Doctor/SignUp_doc/screen/doc_sign_up_screen.dart';
import 'package:e_health_doctor/Presentation/Home/home_screen.dart';
import 'package:e_health_doctor/Presentation/routing/routes.dart';
import 'package:e_health_doctor/Presentation/routing/transition_page_route_builder.dart';
import 'package:e_health_doctor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1518, 733),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            breakpoints: [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ],
          ),
          title: 'Ehealth',
          debugShowCheckedModeBanner: false,
          // home: PatLoginScreen(),
          //initialRoute: '/',
          // home: HomeScreen(),
          home: SignInScreen(),
          onGenerateRoute: (settings) {
            final routes = Routes.getRoutes(settings);
            final WidgetBuilder builder = routes[settings.name]!;
            return FadePageRouteBuilder(
              builder: builder,
              settings: settings,
            );
          },
        );
      },
      // child: MaterialApp(
      //   builder: (context, widget) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, widget!),
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(350, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(600, name: TABLET),
      //       ResponsiveBreakpoint.resize(800, name: DESKTOP),
      //     ],
      //   ),
      //   title: 'Ehealth',
      //   debugShowCheckedModeBanner: false,
      //   home: PatLoginScreen(),
      //   //initialRoute: '/',
      //   onGenerateRoute: (settings) {
      //     final routes = Routes.getRoutes(settings);
      //     final WidgetBuilder builder = routes[settings.name]!;
      //     return FadePageRouteBuilder(
      //       builder: builder,
      //       settings: settings,
      //     );
      //   },
      // ),
    );
  }
}
