import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/widgets/continue_with_widget.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';

import '../widgets/or_devider.dart';

class LetsIn extends StatelessWidget {
  const LetsIn({super.key});

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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10.h),
                  Image.asset("assets/images/lets_in.png"),
                  SizedBox(height: 24.h,),
                  Text(
                    "Let's you in",
                    style: TextStyle(
                      color: MyColors.text_color,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.h,),

                  ContinueWithWidget(
                    imagePath: "assets/images/Facebook_logo.png",
                    text: "Continue with Facebook",
                    onTap: () {},
                    height: 60.h,
                    width: 380.w,
                  ),
                  SizedBox(height: 24.h,),
                  ContinueWithWidget(
                    imagePath: "assets/images/Google_logo.png",
                    text: "Continue with Google",
                    onTap: () {},
                    height: 60.h,
                    width: 380.w,
                  ),
                  SizedBox(height: 24.h,),
                  ContinueWithWidget(
                    imagePath: "assets/images/Apple_logo.png",
                    text: "Continue with Apple",
                    onTap: () {},
                    height: 60.h,
                    width: 380.w,
                  ),
                  const SizedBox(height: 30),
                  OrDivider(
                    text: "or",
                    leftDivider: 155.w,
                    rightDivider: 155.w,
                  ),
                  const SizedBox(height: 30),

                  MyElevatedButton(
                    text: "Sign in with Password",
                    color: MyColors.button_color,
                    height: 58.h,
                    width: 380.w,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.sign_in_login);
                    },
                  ),
                  SizedBox(height: 24.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.sign_up);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: MyColors.button_color,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
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
