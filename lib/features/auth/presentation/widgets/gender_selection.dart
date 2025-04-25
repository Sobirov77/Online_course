import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/core/constants/colors.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectGender;

  bool iconColor = true;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    iconColor = !iconColor;
    if (selectGender == iconColor) {
      iconColor = true;
    } else {
      iconColor = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(
        IconlyBold.arrow_down_2,
        color: iconColor ? Colors.grey : Colors.black,
      ),
      value: selectGender,
      decoration: InputDecoration(
        hintText: "Gender",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: MyColors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      items:
          ['Male', 'Female', 'Other'].map((String gender) {
            return DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectGender = value;
        });
      },
    );
  }
}
