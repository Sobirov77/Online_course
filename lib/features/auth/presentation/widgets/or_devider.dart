import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final double thickness;
  final Color lineColor;
  final double leftDivider;
  final double rightDivider;

  const OrDivider({
    Key? key,
    required this.text,
    required this.leftDivider,
    required this.rightDivider,
    this.thickness = 0.5,
    this.lineColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: leftDivider,
          child: Divider(color: lineColor, thickness: thickness),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        SizedBox(
          width: rightDivider,
          child: Divider(color: lineColor, thickness: thickness),
        ),
      ],
    );
  }
}
