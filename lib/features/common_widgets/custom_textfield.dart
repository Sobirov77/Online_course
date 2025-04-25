import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/core/constants/colors.dart';

class MyTextField extends StatefulWidget {
  final double height;
  final double width;
  final String? labelText;
  final IconData? leadingIcon;
  final Widget? iconButton;
  final TextEditingController? controller;
  final bool obscureText;
  final Color backColor;
  final Color? leadingiconColor;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.height,
    required this.width,
    required this.backColor,
    this.leadingiconColor,
    this.leadingIcon,
    this.iconButton,
    this.controller,
    this.obscureText = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  void dipose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: isFocused ? Colors.lightBlue.shade50 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          focusNode: focusNode,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(fontSize: 14.sp),
            prefixIcon:
                widget.leadingIcon != null
                    ? Icon(
                      widget.leadingIcon,
                      color: widget.leadingiconColor,
                      size: 20.sp,
                    )
                    : null,
            suffixIcon: widget.iconButton,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.button_color, width: 1.5),
              borderRadius: BorderRadius.circular(12.sp),
            ),
          ),
        ),
      ),
    );
  }
}
