import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my_theme.dart';
import 'dashboard/dashboard_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Get.off(DashBoardView());
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = Get.mediaQuery;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 128, 1),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get. height * 0.002),
                Text(
                  "Kezel".toUpperCase(),
                  style: MyTheme.regularTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height*.033,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}