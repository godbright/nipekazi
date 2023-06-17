import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/constants/colors.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  List<Post> posts = [
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: size.height,
      width: size.width,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15.0, crossAxisSpacing: 20),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.4, color: greyColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    posts[index].title,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: wordColors),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "20+  \n Comments",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.poppins(fontSize: 14, color: greyColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
