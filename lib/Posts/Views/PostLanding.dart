import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Posts/Views/NewPost.dart';
import 'package:nipekazi/constants/colors.dart';

class PostLanding extends StatefulWidget {
  const PostLanding({super.key});

  @override
  State<PostLanding> createState() => _PostLandingState();
}

class _PostLandingState extends State<PostLanding> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Image.asset(
              "assets/posts.png",
              height: size.height * 0.4,
              width: size.width * 0.9,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Post what you need and see how  \npeople flood on it ",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16, color: wordColors, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Share what you need any time and get what people can offer through the comments with nice images of what you need ",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: greyColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: (() {
              Get.to(() => NewPost());
            }),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: size.height / 16,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text("Proceed",
                    style:
                        GoogleFonts.poppins(color: whiteColor, fontSize: 15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
