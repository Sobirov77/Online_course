import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallContinueWith extends StatelessWidget {
  final String iconUrl;

  const SmallContinueWith({super.key, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 88.w,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(iconUrl, width: 24.w, height: 24.h)],
      ),
    );
  }
}
