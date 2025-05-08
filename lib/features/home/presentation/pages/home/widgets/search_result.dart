import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/search.dart';
import 'course_card.dart';
import 'mentors_chat_widget.dart';
import 'not_found_widget.dart';

class SearchResultBody extends StatefulWidget {
  final SearchResponse searchResponse;
  final String query;

  const SearchResultBody({
    super.key,
    required this.query,
    required this.searchResponse,
  });

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  String selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 25.h),
          Row(
            children: [
              Expanded(child: _buildCustomButton('Courses')),
              SizedBox(width: 10.w),
              Expanded(child: _buildCustomButton('Mentors')),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Text(
                'Results for ',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                ),
              ),
              Text(
                '“${widget.query}”',
                style: TextStyle(
                  color: Colors.blue[500],
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                '0 found',
                style: TextStyle(
                  color: Colors.blue[500],
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child:
            selectedButton == 'Courses'
                ? (widget.searchResponse.courses.isEmpty
                ? NotFoundPage()
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.searchResponse.courses.length,
              itemBuilder: (context, index) {
                final course = widget.searchResponse.courses[index];
                return CourseCard(
                  onPressed: () {
                    //  AppRoute.go(CourseDetailsPage(id: course.id));
                  },
                  image: course.image!,
                  category: "${course.category}",
                  title: course.title,
                  price: course.price ,
                  oldPrice: "80",
                  rating: "4.8",
                  students: "8289",
                  // onBookmarkPressed: () {},
                );
              },
            ))
                : (widget.searchResponse.mentors.isEmpty
                ? NotFoundPage()
                : ListView.builder(
              itemCount: widget.searchResponse.mentors.length,
              itemBuilder: (context, index) {
                final mentor = widget.searchResponse.mentors[index];
                return ChatsWidget(
                  imagePath: 'assets/images/boy.png',
                  name: mentor.fullName,
                  jobTitle: mentor.expertiseDisplay,
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(String title) {
    bool isSelected = selectedButton == title;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = title;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
        isSelected ? Colors.blue[500] : Colors.white,
        side: BorderSide(color: Colors.blue, width: 2.w),
        padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 14.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.blue[500],
          fontSize: 18,
        ),
      ),
    );
  }
}