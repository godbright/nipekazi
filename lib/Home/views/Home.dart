import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/LandingPage/Views/landing.dart';
import 'package:nipekazi/MarketPlace/Views/market_place.dart';
import 'package:nipekazi/Posts/Controllers/post_controller.dart';
import 'package:nipekazi/Posts/Views/posts.dart';
import 'package:nipekazi/Profile/Views/edit_profile.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostController postController = Get.find();

  List pages = [LandingPage(), PostScreen(), MarketPlace(), EditProfile()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //calling the post service to retrive posts

    postController.getPosts();
    postController.getPostByPerson();
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 20,
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey.withOpacity(0.9),
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: "Posts", icon: Icon(Icons.backpack)),
            const BottomNavigationBarItem(
                label: "Market place", icon: Icon(Icons.shopping_basket)),
            const BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person)),
          ],
        ),
        body: pages[currentIndex]);
  }
}
