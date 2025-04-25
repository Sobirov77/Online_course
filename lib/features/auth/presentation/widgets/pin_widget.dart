import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class MyPin extends StatelessWidget {
  const MyPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      obscureText: true,
      obscuringWidget: Icon(Icons.circle, size: 20.sp, color: Colors.black),
      defaultPinTheme: PinTheme(
        width: 83.w,
        height: 61.h,
        textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 83.w,
        height: 61.h,
        textStyle:  TextStyle(fontSize: 20.sp, color: Colors.black),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 1.3),
        ),
      ),
      onCompleted: (pin) {
        print("PIN: $pin");
      },
    );
  }
}
