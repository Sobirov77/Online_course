import 'package:flutter/cupertino.dart';

class BigContainer extends StatefulWidget {
  final String image;
  final String course_type;
  final String course_name;
  final String current_price;
  final String old_price;

  const BigContainer({
    super.key,
    required this.image,
    required this.course_type,
    required this.course_name,
    required this.current_price,
    required this.old_price,
  });

  @override
  State<BigContainer> createState() => _BigContainerState();
}

class _BigContainerState extends State<BigContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
