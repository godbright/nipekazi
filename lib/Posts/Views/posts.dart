import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Posts/Views/MyPosts.dart';
import 'package:nipekazi/Posts/Views/PostLanding.dart';
import 'package:nipekazi/Widgets/heading.dart';
import 'package:nipekazi/constants/colors.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: HeadingWidget(title: "My Posts"),
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
