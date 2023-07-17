//
//
//
// import 'dart:developer';
//
// import 'package:e_health_doctor/Presentation/Drawer%20Page/drawerPage.dart';
// import 'package:e_health_doctor/Presentation/Home/DashBoard/bloc/doc_dash_board_bloc.dart';
// import 'package:e_health_doctor/Presentation/Home/DashBoard/doctor_dashboard_screen.dart';
// import 'package:e_health_doctor/Presentation/Home/Pages/app_bar.dart';
// // import 'package:e_health_doctor/Presentation/Home/PatientsScreen/bloc/doc_pat_bloc.dart';
// import 'package:e_health_doctor/Presentation/Home/PatientsScreen/doctor_patient_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final User? user = FirebaseAuth.instance.currentUser;
//
//   final ScrollController _scrollController = ScrollController();
//   double _scrollPosition = 0;
//   double _opacity = 0;
//
//   late DocDashBoardBloc _docDashBoardBloc;
//
//   late List<Widget> _pages;
//   late PageController _pageController;
//
//   _scrollListener() {
//     setState(() {
//       _scrollPosition = _scrollController.position.pixels;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _scrollController.addListener(_scrollListener);
//     _docDashBoardBloc = DocDashBoardBloc();
//     _docDashBoardBloc.add(GetDoctorEvent(uid: user!.uid));
//     _docDashBoardBloc.add(GetPatEvent(
//       patList: _docDashBoardBloc.state.doctor!.patientsIDs,
//       uid: user!.uid,
//     ));
//
//     _pages = [
//       DocPatScreen(),
//       DocDashScreen(),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return BlocProvider.value(
//       value: _docDashBoardBloc,
//       child: BlocListener<DocDashBoardBloc, DocDashBoardState>(
//         listener: (context, state) {
//           if (state.page != -1) {
//             // _pageController.animateToPage(state.page,
//             //     duration: Duration(milliseconds: 500), curve: Curves.ease);
//             _pageController.jumpToPage(state.page);
//           }
//
//         },
//         child: BlocBuilder<DocDashBoardBloc, DocDashBoardState>(
//           builder: (context, state) {
//             return Scaffold(
//               appBar: ResponsiveWrapper.of(context).isLargerThan(TABLET)
//                   ? PreferredSize(
//                 preferredSize: Size(screenSize.width, 50.sp),
//                 child: TopBarContents(),
//               )
//                   : AppBar(
//                 iconTheme: IconThemeData(color: Colors.blue),
//                 backgroundColor: Color(0xfff5f5f5),
//                 centerTitle: true,
//                 title: Text(
//                   '💙 EHealth',
//                   style: TextStyle(
//                     color: Color(0xFF077bd7),
//                     fontSize: 30.sp,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: 3.sp,
//                   ),
//                 ),
//                 actions: [],
//               ),
//               body: (state.status == DashBoardStatus.loadingDoctor )
//                   ? Center(
//                 child: Lottie.asset(
//                   'assets/lottie/loading-green.json',
//                   height: 100,
//                   frameRate: FrameRate(120),
//                 ),
//               )
//                   : PageView(
//                 controller: _pageController,
//                 children: _pages,
//                 physics: NeverScrollableScrollPhysics(),
//               ),
//               drawer: ResponsiveWrapper.of(context).isLargerThan(TABLET)
//                   ? null
//                   : DrawerPage(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
