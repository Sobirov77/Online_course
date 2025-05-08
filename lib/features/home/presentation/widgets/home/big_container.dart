import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';

class BigContainer extends StatefulWidget {
  final String category;
  final String title;
  final String imageUrl;
  final double price;
  final double? oldPrice;
  final double rating;
  final int students;

  const BigContainer({
    super.key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.students,
  });

  @override
  State<BigContainer> createState() => _BigContainerState();
}

class _BigContainerState extends State<BigContainer> {
  bool onPressedicon = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 395.w,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.imageUrl,
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.category,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: MyColors.button_color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: MyColors.button_color,
                        ),
                      ),
                      SizedBox(width: 6.h),
                      Text(
                        '\$${widget.oldPrice}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${widget.rating}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '|  ${widget.students} students',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  setState(() {
                    onPressedicon = !onPressedicon;
                  });
                },
                icon: Icon(
                  onPressedicon ? IconlyLight.bookmark : IconlyBold.bookmark,
                  color: MyColors.button_color,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
