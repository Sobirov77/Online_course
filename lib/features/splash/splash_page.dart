import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:real_project/core/constants/colors.dart';

import '../../core/routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RouteNames.splash_images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.button_color,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300.h),
            Image.asset("assets/images/Logo.png"),
            SizedBox(height: 270.h),
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
                colors: [Colors.white],
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
