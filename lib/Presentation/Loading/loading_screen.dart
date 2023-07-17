import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String nextRoute = '/onBoard';

  @override
  void initState() {//nothing
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(Duration(seconds: 2));
    //context.go('/onBoard');
    Navigator.pushReplacementNamed(context, nextRoute);

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.only(left: 100, right: 100),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Icon(
            Icons.health_and_safety_outlined,
            color: Colors.blueAccent,
            size: 200,
          ),
        ),
      ),
    );
  }
}
