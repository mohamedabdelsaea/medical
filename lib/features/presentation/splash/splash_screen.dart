import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical/core/route/page_route_name.dart';
import 'package:medical/core/theme/app_color.dart';
import 'package:medical/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        PageRouteName.welcome,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Image.asset("assets/image/splash.png"),
            ),
            SizedBox(height: 30),
            Text(
              'Clinics',
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
