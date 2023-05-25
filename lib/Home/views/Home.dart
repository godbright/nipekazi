import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/LandingPage/Views/landing.dart';
import 'package:nipekazi/Posts/Views/posts.dart';
import 'package:nipekazi/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [LandingPage(), Post(), LandingPage(), Post()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 20,
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.apps)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.hot_tub_rounded)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.calendar_view_month)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.local_fire_department)),
          ],
        ),
        body: pages[currentIndex]);
  }
}
