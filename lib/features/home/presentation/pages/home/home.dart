import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/features/home/presentation/widgets/home/big_container.dart';
import 'package:real_project/features/home/presentation/widgets/home/home_filter.dart';
import 'package:real_project/features/home/presentation/widgets/home/textfield.dart';
import 'package:real_project/features/home/presentation/widgets/home/top_mentors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                CircleAvatar(
                  radius: 25.sp,
                  backgroundImage: AssetImage("assets/home/profile_avatar.png"),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning👋",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Andrew Ainsley",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.notification, size: 28.sp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.bookmark, size: 28.sp),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.sp),
              child: Column(
                children: [
                  HomeTextField(),
                  SizedBox(height: 10.sp),
                  Image.asset("assets/home/40%off.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Mentors",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: MyColors.button_color,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TopMentors(),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Popular Courses",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: MyColors.button_color,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeFilter(),
                  SizedBox(height: 20.h),
                  BigContainer(
                    category: "3D Design",
                    title: "3D Design Illustration",
                    imageUrl: "assets/home/course_1.png",
                    price: 48,
                    oldPrice: 80,
                    rating: 4.8,
                    students: 8289,
                  ),
                  BigContainer(
                    category: "Entrepeneurship",
                    title: "Digital Entrepreneur",
                    imageUrl: "assets/home/course_2.png",
                    price: 39,
                    rating: 4.9,
                    students: 6182,
                  ),
                  BigContainer(
                    category: "UI/UX Design",
                    title: "Learn UX User Perso",
                    imageUrl: "assets/home/course_3.png",
                    price: 42,
                    oldPrice: 75,
                    rating: 4.7,
                    students: 7938,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
