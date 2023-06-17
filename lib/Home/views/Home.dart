import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/LandingPage/Views/landing.dart';
import 'package:nipekazi/MarketPlace/Views/market_place.dart';
import 'package:nipekazi/Posts/Views/posts.dart';
import 'package:nipekazi/Profile/Views/edit_profile.dart';
import 'package:nipekazi/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    LandingPage(),
    Post(),
    MarketPlace(),
    EditProfile(user: {
      "f_name": "bright",
      "l_name": "uisso",
      "phone": "023432423",
      "email": 'man@gmail.com'
    })
  ];
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
                label: "Home", icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.backpack)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.shopping_basket)),
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.person)),
          ],
        ),
        body: pages[currentIndex]);
  }
}
