import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/routes/route_names.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: TextField(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.home_search);
        },
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.filter,
              size: 20.sp,
              color: MyColors.button_color,
            ),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(
            IconlyLight.search,
            color: Colors.grey[500],
            size: 20.sp,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
