import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/widgets/or_devider.dart';
import 'package:real_project/features/auth/presentation/widgets/small_continue_with.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';
import 'package:real_project/features/common_widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool onPressed = true;
  bool hide_show_Pressed = true;
  bool changeTextBack = true;

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 35.h),
                Text(
                  "Login to your Account",
                  style: TextStyle(
                    color: MyColors.text_color,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35.h),

                MyTextField(
                  labelText: "Email",
                  height: 60.h,
                  width: 380.w,
                  leadingIcon: IconlyLight.message,
                  leadingiconColor: Colors.grey,
                  backColor: Colors.white12,
                ),
                SizedBox(height: 20.h),
                MyTextField(
                  obscureText: hide_show_Pressed,
                  labelText: "Password",
                  height: 60.h,
                  width: 380.w,
                  backColor: Colors.grey,
                  leadingiconColor: Colors.grey,
                  leadingIcon: IconlyLight.lock,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        hide_show_Pressed = !hide_show_Pressed;
                      });
                    },
                    icon: Icon(
                      hide_show_Pressed ? IconlyLight.hide : IconlyLight.show,
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onPressed = !onPressed;
                        });
                      },
                      child:
                          onPressed
                              ? Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Color(0xff335EF7),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )
                              : Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/check_box.png",
                                    ),
                                  ),
                                  color: Colors.grey[100],
                                  border: Border.all(
                                    color: Color(0xff335EF7),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                MyElevatedButton(
                  text: "Sign In",
                  color: MyColors.button_color,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.bottom_nav_bar);
                  },
                  height: 58.h,
                  width: 380.w,
                ),
                SizedBox(height: 15.h),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.forgot_password);
                  },
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(
                      color: MyColors.button_color,
                      fontSize: 16.sp,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                OrDivider(
                  text: "or continue with",
                  leftDivider: 96.w,
                  rightDivider: 96.w,
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContinueWith(
                        iconUrl: "assets/images/Facebook_logo.png",
                      ),
                      SmallContinueWith(
                        iconUrl: "assets/images/Google_logo.png",
                      ),
                      SmallContinueWith(
                        iconUrl: "assets/images/Apple_logo.png",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't, have an acoount?",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.sign_up);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: MyColors.button_color),
                      ),
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
}
