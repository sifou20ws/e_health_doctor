import 'dart:developer';

import 'package:e_health_doctor/Presentation/Authentification/Commun/Models/Patient_data_model.dart';
import 'package:e_health_doctor/Presentation/Home/DashBoard/bloc/doc_dash_board_bloc.dart';
import 'package:e_health_doctor/Presentation/Home/PatientHistory/history_screen.dart';
import 'package:e_health_doctor/Presentation/Home/Widgets/info_box_widget.dart';
import 'package:e_health_doctor/Presentation/Home/Widgets/pat_info_widget.dart';
import 'package:e_health_doctor/Presentation/Widgets/select_butt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DocPatScreen extends StatefulWidget {
  // DocPatScreen({required this.uid});
  //
  // final String uid;
  DocPatScreen();

  @override
  State<DocPatScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<DocPatScreen> {
  late DocDashBoardBloc _docDashBoardBloc;
  final User? user = FirebaseAuth.instance.currentUser;
  List<PatientDataModel> filteredPatients = [];

  void initState() {
    super.initState();
    _docDashBoardBloc = BlocProvider.of<DocDashBoardBloc>(context);
    filteredPatients = _docDashBoardBloc.state.patients;
  }

  List<String> columns = ['Pat name', 'Gender', 'Last visited', 'Diseases'];
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool webView = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    // String searchText = "";
    bool found = true;
    void searchFunc(
        {required List<PatientDataModel> list, required String searchText}) {
      List<PatientDataModel> tempList = [];
      if (searchText.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          String name =
              list[i].fName.toLowerCase() + list[i].lName.toLowerCase();
          if (name.contains(searchText.toLowerCase())) {
            tempList.add(list[i]);
          }
        }
        setState(() {
          found = true;
          filteredPatients = tempList;
        });
      }
      if (filteredPatients.isEmpty) {
        setState(() {
          found = false;
        });
      }
    }

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
                      decoration: BoxDecoration(
                        color: Color(0xfff5f5f5),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(11.sp, 0.sp, 11.sp, 20.sp),
                        child: Column(
                          children: [
                            Container(
                              padding: webView
                                  ? EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                              width: screenSize.width,
                              height: webView
                                  ? screenSize.height * 0.2
                                  : screenSize.height * 0.1,
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TransButtonText(
                                            lable: 'Male',
                                            onTab: () {
                                              log('Male');
                                            },
                                          ),
                                          // SizedBox(width: 20.sp),
                                          TransButtonText(
                                            state: false,
                                            lable: 'Female',
                                            onTab: () {
                                              log('female');
                                            },
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0.sp),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Container(
                                          width: screenSize.width / 4,
                                          height: screenSize.height * 0.08,
                                          decoration: BoxDecoration(
                                            color: Color(0xfff5e1e9),
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                          ),
                                          child: Slider(
                                            value: _currentSliderValue,
                                            max: 100,
                                            divisions: 5,
                                            label: _currentSliderValue
                                                .round()
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                _currentSliderValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: 20.sp),
                                  Expanded(
                                      flex: 2,
                                      child: SearchBar(screenSize: screenSize)),
                                  // SizedBox(width: 20.sp),
                                ],
                              ),
                            ),
                            Wrap(
                              spacing:
                                  8.0, // horizontal spacing between children
                              runSpacing: 8.0, // vertical spacing between lines
                              children:
                                  List.generate(state.patients.length, (index) {
                                List<PatientDataModel> patients =
                                    state.patients;
                                int length = patients.length;
                                if (index < length) {
                                  return GestureDetector(
                                    onTap: () {
                                      // log(patients[index].id.toString());
                                      // log(patients[index].lName);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PatHistoryScreen(
                                                  patUid: patients[index]
                                                      .id
                                                      .toString()),
                                        ),
                                      );
                                    },
                                    child: PatientInfoBox(
                                      name: patients[index].lName +
                                          '\n' +
                                          patients[index].fName,
                                      webView: webView,
                                      screenSize: screenSize,
                                      age: patients[index].dateOfBirth,
                                      gender: patients[index].gender,
                                      blood: patients[index].blood,
                                      address: patients[index].blood,
                                      email: patients[index].email,
                                      phone: patients[index].phone,
                                    ),
                                  );
                                } else {
                                  return Container(); // placeholder for any remaining empty spaces
                                }
                              }),
                            ),
                            SizedBox(height: 500.sp),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          width: screenSize.width / 2,
          height: screenSize.height * 0.1,
          alignment: Alignment.center,
          child: TextField(
            onChanged: (value) {
              // setState(() {
              //   searchFunc(
              //       searchText: value,
              //       list: state.patients);
              // });
            },
            enabled: true,
            style: TextStyle(fontSize: 17.sp),
            decoration: InputDecoration(
              //nothing
              filled: true,
              // fillColor: Color.fromARGB(100, 204, 204, 204),
              fillColor: Color(0xffE1E1E1),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide(
                    color: Color.fromARGB(100, 33, 150, 243), width: 2.sp),
              ),
              // prefixIcon:
              //     ImageIcon(AssetImage('assets/icons/email.png')),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Colors.black.withAlpha(100), fontSize: 18.sp),
              prefixIcon: Icon(Icons.search),
              // suffixIcon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
