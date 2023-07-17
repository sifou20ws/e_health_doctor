import 'dart:developer';
import 'package:e_health_doctor/Presentation/Home/DashBoard/bloc/doc_dash_board_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarContents extends StatefulWidget {
  TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  late DocDashBoardBloc _docDashBoardBloc;
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
    _docDashBoardBloc = BlocProvider.of<DocDashBoardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1.sp,
            blurRadius: 2.sp,
            offset: Offset(0.sp, 1.sp),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20.sp),
                Padding(
                  padding: EdgeInsets.only(bottom: 7.sp),
                  child: Text(
                    '💙 EHealth',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3.sp,
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width / 15),
                AppBarItemWidget(
                  title: 'Home',
                  index: 0,
                  isHovering: _isHovering,
                  active: (_docDashBoardBloc.state.page==0)?true : false,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[0] = true : _isHovering[0] = false;
                    });
                  },
                  onPressed: () {
                    _docDashBoardBloc.add(ChangeScreenEvent(page: 0));
                  },
                ),
                SizedBox(width: screenSize.width / 15),
                AppBarItemWidget(
                  title: 'Patients',
                  index: 1,
                  isHovering: _isHovering,
                  active: (_docDashBoardBloc.state.page==1)?true : false,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  },
                  onPressed: () {
                    _docDashBoardBloc.add(ChangeScreenEvent(page: 1));
                  },
                ),
                SizedBox(width: screenSize.width / 15),
                AppBarItemWidget(
                  title: 'Profile',
                  index: 2,
                  isHovering: _isHovering,
                  active: (_docDashBoardBloc.state.page==2)?true : false,

                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  onPressed: () {
                    _docDashBoardBloc.add(ChangeScreenEvent(page: 2));
                  },
                ),
                SizedBox(width: screenSize.width / 15),
                AppBarItemWidget(
                  title: 'About',
                  index: 3,
                  isHovering: _isHovering,
                  active: (_docDashBoardBloc.state.page==3)?true : false,

                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onPressed: () {
                    _docDashBoardBloc.add(ChangeScreenEvent(page: 3));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBarIconWidget(
                  icon: Icons.notifications_none_outlined,
                  onTap: () {},
                ),
                SizedBox(width: 10.sp),
                AppBarIconWidget(
                  icon: Icons.settings_outlined,
                  onTap: () {},
                ),
                SizedBox(width: 20.sp),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: SizedBox(
                    width: 1.sp,
                    child: Container(color: Colors.black),
                  ),
                ),
                SizedBox(width: 20.sp),
                AppBarItemWidget(
                  title: 'Dr.Sifou',
                  index: 4,
                  isHovering: _isHovering,
                  active: (_docDashBoardBloc.state.page==4)?true : false,

                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[4] = true : _isHovering[4] = false;
                    });
                  },
                  onPressed: () {
                    _docDashBoardBloc.add(ChangeScreenEvent(page: 4));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarIconWidget extends StatelessWidget {
  AppBarIconWidget({
    required this.icon,
    required this.onTap,
  });
  IconData icon;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // color: Colors.black,
          child: Icon(
            icon,
            color: Colors.blue,
            size: 25.sp,
          ),
          onTap: onTap,
        ),
        SizedBox(width: 7.sp),
      ],
    );
  }
}

class AppBarItemWidget extends StatelessWidget {
  AppBarItemWidget({
    required this.isHovering,
    required this.onPressed,
    required this.onHover,
    required this.title,
    required this.index,
    required this.active,
  });

  void Function(bool isHovered) onHover;
  final String title;
  final List isHovering;
  final VoidCallback onPressed;
  final int index;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                color:
                    isHovering[index] ? Color(0xFF077bd7) : Color(0xFF077bd7),
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(height: 5.sp),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: active || isHovering[index],
            child: Container(
              height: 2.sp,
              width: 40.sp,
              color: Color(0xFF051441),
            ),
          )
        ],
      ),
    );
  }
}
