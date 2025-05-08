import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_event.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';
import '../bloc/confirm/confirm_state.dart';

class OtpCodeConfirmation extends StatefulWidget {
  final int user_id;

  const OtpCodeConfirmation({super.key, required this.user_id});

  @override
  State<OtpCodeConfirmation> createState() => _PinState();
}

class _PinState extends State<OtpCodeConfirmation> {
  String myCode = "";

  void confirmOTPcode(BuildContext context) {
    context.read<ConfirmEmailBloc>().add(
      SendConfirmCodeEvent(
        user_id: widget.user_id,
        code: int.parse(myCode) ?? 0,
        isResetPassword: true,
      ),
    );
    // print("User ID : ${widget.user_id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirmation OTP Code",
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
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 130.h),

                  Text(
                    "Confirm the code we sent to your email",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.text_color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100.h),
                  Pinput(
                    length: 4,
                    obscureText: true,
                    obscuringWidget: Icon(
                      Icons.circle,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                    defaultPinTheme: PinTheme(
                      width: 83.w,
                      height: 61.h,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 83.w,
                      height: 61.h,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue, width: 1.3),
                      ),
                    ),
                    onCompleted: (pin) {
                      setState(() {
                        myCode = pin;
                      });
                    },
                  ),
                  SizedBox(height: 50.h),
                  BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
                    listener: (context, state) {
                      if (state is ConfirmEmailSuccess) {
                        Navigator.pushNamed(context, RouteNames.home);
                      } else if (state is ConfirmEmailFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      if (state is ConfirmEmailLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return MyElevatedButton(
                        text: "Continue",
                        color: MyColors.button_color,
                        onPressed: () => confirmOTPcode(context),

                        height: 58.h,
                        width: 380.w,
                      );
                    },
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
