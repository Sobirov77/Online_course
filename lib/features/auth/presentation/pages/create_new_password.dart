import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';
import 'package:real_project/features/common_widgets/custom_textfield.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool hide_show_Pressed = true;
  bool hide_show_Pressed_2 = true;
  bool onPressed = true;

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
          "Create New Password",
          style: TextStyle(
            color: MyColors.text_color,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75.h),
                Center(
                  child: SizedBox(
                    height: 250.h,
                    width: 329.w,
                    child: Image.asset("assets/images/create_password.png"),
                  ),
                ),
                SizedBox(height: 75.h),
                Text(
                  "Creating Your New Password",
                  style: TextStyle(
                    color: MyColors.text_color,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                MyTextField(
                  obscureText: hide_show_Pressed_2,
                  labelText: "New Password",
                  height: 58.h,
                  width: 380.w,
                  backColor: MyColors.grey,
                  leadingIcon: IconlyBold.lock,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        hide_show_Pressed_2 = !hide_show_Pressed_2;
                      });
                    },
                    icon: Icon(
                      hide_show_Pressed_2 ? IconlyBold.hide : IconlyBold.show,
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                MyTextField(
                  obscureText: hide_show_Pressed,
                  labelText: "Repeat New Password",
                  height: 58.h,
                  width: 380.w,
                  backColor: MyColors.grey,
                  leadingIcon: IconlyBold.lock,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        hide_show_Pressed = !hide_show_Pressed;
                      });
                    },
                    icon: Icon(
                      hide_show_Pressed ? IconlyBold.hide : IconlyBold.show,
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
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
                SizedBox(height: 70.h),
                MyElevatedButton(
                  text: "Continue",
                  color: MyColors.button_color,
                  onPressed: () {
                    Congratulation(context);
                  },
                  height: 58.h,
                  width: 380.w,
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
