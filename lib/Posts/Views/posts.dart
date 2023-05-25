import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Posts/Views/MyPosts.dart';
import 'package:nipekazi/Posts/Views/PostLanding.dart';
import 'package:nipekazi/constants/colors.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "My Posts",
                style: GoogleFonts.poppins(
                    color: wordColors, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          bottom: TabBar(
            onTap: (value) {
              // if (value == 0) {
              //   getFiles("all");
              //   where = "uploads/$userId";
              // } else if (value == 1) {
              //   getFiles('xray');
              //   where = "radiology/$userId";
              // } else if (value == 2) {
              //   getFiles('damu');
              //   where = "damu/$userId";
              // } else if (value == 3) {
              //   getFiles('covid');
              //   where = "covid/$userId";
              // }

              // print(value);
            },
            labelStyle:
                TextStyle(color: wordColors, fontWeight: FontWeight.bold),
            labelColor: wordColors,
            tabs: const [
              Tab(text: "My Posts"),
              Tab(
                text: "Posts",
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(1),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: TabBarView(
              children: [MyPosts(), PostLanding()],
            )),
      ),
    );
  }
}
