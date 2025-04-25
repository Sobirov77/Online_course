import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';

class ImageSliderPage extends StatefulWidget {
  const ImageSliderPage({super.key});

  @override
  State<ImageSliderPage> createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    "assets/images/Splash_1.png",
    "assets/images/Splash_2.png",
    "assets/images/Splash_3.png",
  ];

  final List<String> texts = [
    "We provide the best learning courses & great mentors!",
    "Learn anytime and anywhere easily and conveniently!",
    "Start your journey to success now! \n ",
  ];

  void _nextPage() {
    if (_currentPage < images.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to SignInPage
      Navigator.pushNamed(context, RouteNames.sign_up);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50.h),

            // Image Swiper
            SizedBox(
              height: 320.h,
              width: 320.w,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(images[index], fit: BoxFit.cover);
                },
              ),
            ),

            SizedBox(height: 20.h),

            // Dynamic Text based on page index
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                texts[_currentPage],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.text_color,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                bool isActive = index == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 8.w,
                  width: isActive ? 32.w : 8.w,
                  decoration: BoxDecoration(
                    color:
                        isActive ? MyColors.button_color : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
            // SizedBox(),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SizedBox(
                height: 58.h,
                width: 380.w,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.button_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    _currentPage == images.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
