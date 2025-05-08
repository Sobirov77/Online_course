import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMentors extends StatelessWidget {
  const TopMentors({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(width: 15.w,),
        TopMentors_1(image: 'assets/home/Jacob.png', text: "Jacob"),
        SizedBox(width: 16.w,),
        TopMentors_1(image: 'assets/home/Claire.png', text: "Claire"),
        SizedBox(width: 16.w,),
        TopMentors_1(image: 'assets/home/Priscilla.png', text: "Priscilla"),
        SizedBox(width: 16.w,),
        TopMentors_1(image: 'assets/home/Wade.png', text: "Wade"),
        SizedBox(width: 16.w,),
        TopMentors_1(image: 'assets/home/Kathryn.png', text: "Kathryn"),


      ]),
    );
  }

  Column TopMentors_1({required String image, required String text}) {
    return Column(
      children: [
        CircleAvatar(radius: 40.r, backgroundImage: AssetImage(image)),
        SizedBox(height: 8.h),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
