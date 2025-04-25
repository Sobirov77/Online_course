import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/features/auth/presentation/widgets/via_sms_email_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left),
        ),
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 24.sp,
            color: MyColors.text_color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 250.h,
                    width: 276.w,
                    child: Image.asset("assets/images/forgot_pass.png"),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                      color: MyColors.text_color,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ViaSmsEmail(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
