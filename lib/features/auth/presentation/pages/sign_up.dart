import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/auth_event.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_state.dart';
import 'package:real_project/features/auth/presentation/widgets/or_devider.dart';
import 'package:real_project/features/auth/presentation/widgets/small_continue_with.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';
import 'package:real_project/features/common_widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _confirmPasswordFocusNode.addListener(() => setState(() {}));
    _emailFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool onPressed = true;
  bool hide_show_Pressed = true;
  bool hide_show_Pressed_2 = true;
  bool changeTextBack = true;

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? _validateForm() {
    if (_emailController.text.isEmpty) {
      return 'Please enter your email';
    }
    if (!_isEmailValid(_emailController.text)) {
      return 'Please enter a valid email';
    }
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    if (_passwordController.text.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (_confirmPasswordController.text.isEmpty) {
      return 'Please confirm your password';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void doRegister() {
    final validationError = _validateForm();
    if (validationError != null) {
      setState(() {
        _errorMessage = validationError;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError), backgroundColor: Colors.red),
      );
      return;
    }
    setState(() {
      _errorMessage = null;
    });

    context.read<RegisterBloc>().add(
      RegisterEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

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
                Text(
                  "Create your Account",
                  style: TextStyle(
                    color: MyColors.text_color,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 55.h),

                MyTextField(
                  controller: _emailController,
                  labelText: "Email",
                  height: 60.h,
                  width: 380.w,
                  leadingIcon: IconlyLight.message,
                  leadingiconColor: Colors.grey,
                  backColor: Colors.white12,
                ),
                SizedBox(height: 20.h),
                MyTextField(
                  controller: _passwordController,
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
                MyTextField(
                  controller: _confirmPasswordController,
                  obscureText: hide_show_Pressed_2,
                  labelText: "Repead Password",
                  height: 60.h,
                  width: 380.w,
                  backColor: Colors.grey,
                  leadingiconColor: Colors.grey,
                  leadingIcon: IconlyLight.lock,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        hide_show_Pressed_2 = !hide_show_Pressed_2;
                      });
                    },
                    icon: Icon(
                      hide_show_Pressed_2 ? IconlyLight.hide : IconlyLight.show,
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
                                  color: Colors.grey[100],
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

                BlocConsumer<RegisterBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoaded) {
                      Navigator.pushNamed(
                        context,
                        RouteNames.otp_confirm,
                        arguments: state.register.user_id,
                      );
                    } else if (state is AuthError) {
                      print('Error state: ${state.error}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                      setState(() {
                        _errorMessage = state.error;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyColors.button_color,
                        ),
                      );
                    }
                    // else if (state is AuthLoaded) {
                    //   return const Center(
                    //     child: Text(
                    //       'Sign-up successful! Redirecting...',
                    //       style: TextStyle(color: Colors.green, fontSize: 16),
                    //     ),
                    //   );
                    // }
                    else {
                      return MyElevatedButton(
                        text: "Sign Up",
                        color: MyColors.button_color,
                        onPressed: () {
                          doRegister();
                        },
                        height: 58.h,
                        width: 380.w,
                      );
                    }
                  },
                ),
                SizedBox(height: 60.h),

                OrDivider(
                  text: "or continue with",
                  leftDivider: 96.w,
                  rightDivider: 96.w,
                ),
                SizedBox(height: 30.h),

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
                      "Already, have an acoount?",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.sign_in_login);
                      },
                      child: Text(
                        "Sign In",
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
