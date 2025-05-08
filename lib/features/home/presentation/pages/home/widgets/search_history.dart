import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class SearchHistoryBody extends StatefulWidget {
  const SearchHistoryBody({super.key});

  @override
  State<SearchHistoryBody> createState() => _SearchHistoryBodyState();
}

class _SearchHistoryBodyState extends State<SearchHistoryBody> {
  bool clearAll = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 14.h),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style: TextStyle(fontSize: 20, color: Colors.grey[900]),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    clearAll = false;
                  });
                },
                child: Text(
                  "Clear All",
                  style: TextStyle(color: Colors.blue[500], fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 1, color: Colors.grey[200]),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder:
                  (context, index) =>
                      clearAll ? _searchedHistory() : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchedHistory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Wassup Man ???",
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
        IconButton(onPressed: () {}, icon: Icon(IconlyLight.close_square)),
      ],
    );
  }
}
