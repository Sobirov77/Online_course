import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:real_project/features/home/presentation/pages/inbox/inbox.dart';
import 'package:real_project/features/home/presentation/pages/transaction/transaction.dart';

import '../../../auth/presentation/pages/profile.dart';
import 'home/home.dart';
import 'my course/my_course.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  int _currentIndex = 0;
  List<Widget> pages =  [
    Home(),
    MyCourse(),
    Inbox(),
    Transaction(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: pages[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.blueAccent,
          currentIndex: _currentIndex,
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItemWidget("Home", const Icon(IconlyLight.home)),
            BottomNavigationBarItemWidget( "My Course", const Icon(IconlyLight.document),),
            BottomNavigationBarItemWidget("Inbox", const Icon(IconlyLight.chat)),
            BottomNavigationBarItemWidget("Transaction", const Icon(IconlyLight.buy)),
            BottomNavigationBarItemWidget("Profile", const Icon(IconlyLight.profile)),
          ],
        ));
  }
}

BottomNavigationBarItem BottomNavigationBarItemWidget(
    String label, Icon icon) {
  return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: label,
      icon: icon
  );
}