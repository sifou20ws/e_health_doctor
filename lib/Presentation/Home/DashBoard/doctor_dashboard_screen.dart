import 'dart:developer';

import 'package:e_health_doctor/Presentation/Home/DashBoard/bloc/doc_dash_board_bloc.dart';
import 'package:e_health_doctor/Presentation/Home/Widgets/doc_info_widget.dart';
import 'package:e_health_doctor/Presentation/Home/Widgets/info_box_widget.dart';
import 'package:e_health_doctor/Presentation/Widgets/PatProfileWidget.dart';
import 'package:e_health_doctor/Presentation/Widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_table/table_sticky_headers.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DocDashScreen extends StatefulWidget {
  // PatDashScreen({required this.uid});
  //
  // final String uid;
  DocDashScreen();

  @override
  State<DocDashScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<DocDashScreen> {
  late DocDashBoardBloc _docDashBoardBloc;
  final User? user = FirebaseAuth.instance.currentUser;

  void initState() {
    super.initState();
    _docDashBoardBloc = BlocProvider.of<DocDashBoardBloc>(context);
    // _docDashBoardBloc.add(GetDoctorEvent(uid: user!.uid));
  }

  List<String> columns = ['Pat name', 'Gender', 'Last visited', 'Diseases'];
  @override
  Widget build(BuildContext context) {
    DataTableSource _data = TableData();
    var screenSize = MediaQuery.of(context).size;
    bool webView = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return BlocProvider.value(
      value: _docDashBoardBloc,
      child: BlocListener<DocDashBoardBloc, DocDashBoardState>(
        listener: (context, state) {},
        child: BlocBuilder<DocDashBoardBloc, DocDashBoardState>(
          builder: (context, state) {
            return (state.status == DashBoardStatus.loadingPatient ||
                    state.status == DashBoardStatus.loadingDoctor)
                ? Center(
                    child: Lottie.asset(
                      'assets/lottie/loading-green.json',
                      height: 100,
                      frameRate: FrameRate(120),
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //   color: Color(0xfff5f5f5),
                      // ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(11.sp, 0.sp, 11.sp, 20.sp),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.sp),
                                  Text(
                                    'Welcome back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:webView? 20.sp : 40.sp),
                                  ),
                                  Text(
                                    'Dr.' + state.doctor!.fullName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: webView? 15.sp : 35.sp),
                                  ),
                                  SizedBox(height: 20.sp),
                                  Container(
                                    // width: screenSize.width * 2 / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InfoBoxWidget(
                                          icon: Icon(
                                            Icons.person,
                                          ),
                                          title: 'Total Patients',
                                          value: state
                                              .doctor!.patientsIDs.length
                                              .toString(),
                                        ),
                                        // SizedBox(width: screenSize.width / 22),
                                        InfoBoxWidget(
                                          icon: Icon(
                                            Icons.chat,
                                          ),
                                          title: 'Total Messages',
                                          value: '15',
                                        ),
                                        // SizedBox(width: screenSize.width / 22),
                                        InfoBoxWidget(
                                          icon: Icon(
                                            Icons.add_alert,
                                          ),
                                          title: 'Total Alerts',
                                          value: '3',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.sp),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        20.sp, 15.sp, 15.sp, 10.sp),
                                    margin: webView
                                        ? EdgeInsets.fromLTRB(
                                            20.sp, 15.sp, 15.sp, 10.sp)
                                        : EdgeInsets.fromLTRB(
                                            25.sp, 15.sp, 25.sp, 15.sp),
                                    // width: screenSize.width * 2 / 3,
                                    // height: screenSize.height * 2 / 3,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff5e1e9),
                                      borderRadius:
                                          BorderRadius.circular(24.sp),
                                    ),
                                    child: SingleChildScrollView(
                                      child: PaginatedDataTable(
                                        header: Text('Today\'s Appointments'),
                                        columnSpacing: 100,
                                        horizontalMargin: 60,
                                        columns: [
                                          DataColumn(label: Text('Name')),
                                          DataColumn(label: Text('Gender')),
                                          DataColumn(
                                              label: Text('Last visited')),
                                          DataColumn(label: Text('Diseases')),
                                        ],
                                        source: _data,
                                        rowsPerPage: 5,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.sp),
                                ],
                              ),
                            ),
                            webView
                                ? Expanded(
                                    flex: 1,
                                    child: DocInfoWidget(
                                      image: 'assets/images/female_doc.jpg',
                                      name: 'DR.' + state.doctor!.fullName,
                                      gender: state.doctor!.gender,
                                      specialist: state.doctor!.speciality,
                                      hosName: state.doctor!.hosName,
                                      hosAddr: state.doctor!.hosAddress,
                                      email: state.doctor!.email,
                                    ),
                                  )
                                : Container(),
                          ],
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

class TableData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
    5,
    (index) => {
      'Name': 'Patient $index',
      'Gender': index.isEven ? 'Male' : 'Female',
      'Last visited': DateTime(2023, 4, 20).add(Duration(days: index)),
      'Diseases': index.isEven ? 'fever' : 'Anemia',
    },
  );
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]['Name'].toString())),
      DataCell(Text(data[index]['Gender'].toString())),
      DataCell(Text(data[index]['Last visited'].toString())),
      DataCell(Text(data[index]['Diseases'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

// class InfoBoxWidget extends StatelessWidget {
//   const InfoBoxWidget(
//       {required this.icon, required this.title, required this.value});
//   final Widget icon;
//   final String title, value;
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.fromLTRB(22.69.sp, 17.53.sp, 18.7.sp, 10.sp),
//       width: screenSize.width / 5,
//       height: 120.sp,
//       decoration: BoxDecoration(
//         color: Color(0xfff5e1e9),
//         borderRadius: BorderRadius.circular(24.sp),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25.sp),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 icon,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400, fontSize: 20.sp),
//                     ),
//                     FittedBox(
//                       child: Text(
//                         value,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 16.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               'See more ->',
//               style: TextStyle(fontSize: 14.sp, color: Colors.blue),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
/** **************************/
// Container(
// height: 300,
// width: screenSize.width,
// color: Colors.blue.withOpacity(0.7),
// child: StickyHeadersTable(
// initialScrollOffsetX: _scrollOffsetX,
// initialScrollOffsetY: _scrollOffsetY,
// onEndScrolling: (scrollOffsetX, scrollOffsetY) {
// _scrollOffsetX = scrollOffsetX;
// _scrollOffsetY = scrollOffsetY;
// },
// columnsLength: 3,
// rowsLength: 3,
// columnsTitleBuilder: (int columnIndex) {
// return FittedBox(child: Text(columns[columnIndex]));
// },
// rowsTitleBuilder: (int rowIndex) {
// return Container();
// },
// contentCellBuilder: (int columnIndex, int rowIndex) {
// return Text('cell $rowIndex  , $columnIndex');
// },
// ),
// )
