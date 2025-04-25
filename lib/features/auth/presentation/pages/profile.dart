import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_project/core/constants/colors.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/widgets/gender_selection.dart';
import 'package:real_project/features/common_widgets/custom_button.dart';
import 'package:real_project/features/common_widgets/custom_textfield.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile;
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();
  bool fordate = true;

  void dateIconChange() {
    setState(() {
      fordate = !fordate;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left),
        ),
        title: Text(
          "Fill Your Profile",
          style: TextStyle(
            color: MyColors.text_color,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70.sp,
                        backgroundImage:
                            _imageFile != null
                                ? FileImage(_imageFile!)
                                : AssetImage("assets/images/person.png")
                                    as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            child: Image.asset("assets/images/pen.png"),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  MyTextField(
                    labelText: "Full Name",
                    height: 56.h,
                    width: 380.w,
                    backColor: MyColors.grey,
                  ),
                  SizedBox(height: 24.h),
                  MyTextField(
                    labelText: "Nickname",
                    height: 56.h,
                    width: 380.w,
                    backColor: MyColors.grey,
                  ),
                  SizedBox(height: 24.h),
                  MyTextField(
                    controller: _dateController,
                    labelText: "Date of birth",
                    height: 56.h,
                    width: 380.w,
                    backColor: MyColors.grey,
                    iconButton: IconButton(
                      onPressed: () {
                        _pickDate();
                        dateIconChange();
                        if (_pickDate == dispose) {
                          fordate = true;
                        } else {
                          fordate = false;
                        }
                      },
                      icon: Icon(
                        IconlyLight.calendar,
                        color: fordate ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  MyTextField(
                    labelText: "Email",
                    height: 56.h,
                    width: 380.w,
                    backColor: MyColors.grey,
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.message, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  MyTextField(
                    labelText: "Phone Number",
                    height: 56.h,
                    width: 380.w,
                    backColor: MyColors.grey,
                  ),
                  SizedBox(height: 24.h),
                  GenderSelection(),
                  SizedBox(height: 70.h),
                  MyElevatedButton(
                    text: "Continue",
                    color: MyColors.button_color,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.pin);
                    },
                    height: 58.h,
                    width: 380.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
