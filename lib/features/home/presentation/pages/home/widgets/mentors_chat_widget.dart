import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/constants/colors.dart';

class ChatsWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String jobTitle;

  const ChatsWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) => Icon(
                    IconlyBold.user_3,
                    color: Colors.grey.shade400,
                    size: 50.h,
                  ),
                  placeholder:
                      (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade900,
                  ),
                ),
                Text(
                  jobTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.chat,
                color: AppColors.blue500,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}