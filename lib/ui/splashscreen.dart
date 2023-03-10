import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/ui/selectSlang.dart';

class SplashScreen extends StatefulWidget {
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    var duration = const Duration(seconds: 4);
    return Timer(duration, routeDashboardMain);
  }

  routeDashboardMain() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectSlang()));
  }

  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Container(
              child: Image.asset('assets/img/malaysia_flag_1.png'),
            ),
          )
        ],
      ),
    );
  }
}
