import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/widgets/pin_widget.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';

class OtpCodeConfirmation extends StatefulWidget {

  final int user_id;
  const OtpCodeConfirmation({super.key, required this.user_id});

  @override
  State<OtpCodeConfirmation> createState() => _PinState();
}

class _PinState extends State<OtpCodeConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "Confirmation OTP Code",
        //   style: TextStyle(
        //     color: MyColors.text_color,
        //     fontSize: 24.sp,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
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
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 130.h,),

                  Text(
                    "Confirm the code we sent to your email",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.text_color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100.h,),
                  MyPin(),
                  SizedBox(height: 50.h,),
                  MyElevatedButton(
                    text: "Continue",
                    color: MyColors.button_color,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.finger_print);
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
