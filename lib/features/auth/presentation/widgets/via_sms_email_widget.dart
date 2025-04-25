import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';

import '../../../../core/routes/route_names.dart';

class ViaSmsEmail extends StatefulWidget {
  const ViaSmsEmail({super.key});

  @override
  State<ViaSmsEmail> createState() => _ViaSmsEmailState();
}

class _ViaSmsEmailState extends State<ViaSmsEmail> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOptionBox(
          0,
          Icon(IconlyBold.chat, color: MyColors.button_color, size: 27.sp,),
          'via SMS:',
          '+1 111 ******99',
        ),
        SizedBox(height: 16.h),
        _buildOptionBox(
          1,
          Icon(IconlyBold.message, color: MyColors.button_color, size: 27.sp,),
          'via Email:',
          'and***ley@yourdomain.com',
        ),
        SizedBox(height: 32.h),
        Container(
          height: 58.h,
          width: 380.w,
          child: ElevatedButton(
            onPressed:
                selectedIndex != null
                    ? () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.forgot_password_code,
                      );
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  selectedIndex != null ? MyColors.button_color : Colors.grey.shade300,
              foregroundColor:
                  selectedIndex != null ? Colors.white : Colors.grey,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Continue"),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionBox(int index, Icon icon, String text, String text1) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 128.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? MyColors.button_color : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            CircleAvatar(child: icon, radius: 40.sp),
            SizedBox(width: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(height: 5.h,),
                Text(text1, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
