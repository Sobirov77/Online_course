import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set Your Fingerprint",
          style: TextStyle(
            color: MyColors.text_color,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(IconlyLight.arrow_left)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 75.h),
                Text(
                  "Add a fingerprint to make your account\n                        "
                  "more secure.",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.text_color,
                  ),
                ),
                SizedBox(height: 75.h),
                Container(
                  width: 300.w,
                  height: 300.h,
                  child: Image.asset("assets/images/finger.png"),
                ),
                SizedBox(height: 80.h),
                Text(
                  "Please put your finger on the fingerprint\n                "
                  "scanner to get started.",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.text_color,
                  ),
                ),
                SizedBox(height: 80.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 58,
                      width: 184,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Skip",
                          style: TextStyle(color: MyColors.button_color),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEBEFFE),
                        ),
                      ),
                    ),
                    MyElevatedButton(
                      text: "Continue",
                      color: MyColors.button_color,
                      onPressed: () {
                        Congratulation(context);
                      },
                      height: 58.h,
                      width: 184.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Congratulation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Auto-close after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, RouteNames.home);
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [Image.asset('assets/images/congratulation.png')],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your account is ready to use. You will be redirected to the Home page in a few seconds..",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),

                // Loading animation
                const SizedBox(
                  height: 60,
                  width: 60,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [Colors.blue],
                    strokeWidth: 7,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
