import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/routes/route_names.dart';
import '../../../common_widgets/custom_button.dart';
import '../widgets/pin_widget.dart';

class ForgotPasswordCode extends StatefulWidget {
  const ForgotPasswordCode({super.key});

  @override
  State<ForgotPasswordCode> createState() => _ForgotPasswordCodeState();
}

class _ForgotPasswordCodeState extends State<ForgotPasswordCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            color: MyColors.text_color,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),

                  Text(
                    "Code has been sent to +1 111******99",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.text_color,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  MyPin(),
                  SizedBox(height: 60.h),
                  Text(
                    "Reset code in 55 s",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.text_color,
                    ),
                  ),
                  SizedBox(height: 100.h),
                  MyElevatedButton(
                    text: "Verify",
                    color: MyColors.button_color,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.create_new_password);
                    },
                    height: 58.h,
                    width: 380.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
