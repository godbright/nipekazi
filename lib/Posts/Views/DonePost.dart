import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Auth/views/auth.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Login/View/Login.dart';
import 'package:nipekazi/constants/colors.dart';

class DonePost extends StatefulWidget {
  const DonePost({super.key});

  @override
  State<DonePost> createState() => _DonePostState();
}

class _DonePostState extends State<DonePost> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/conf.png",
          height: size.height * 0.4,
          width: size.width * 0.9,
        ),
        Text(
          "Successful",
          style: GoogleFonts.poppins(
              color: wordColors, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          "You post has been shared to our platform",
          style: GoogleFonts.poppins(color: Colors.grey),
        ),
        SizedBox(
          height: size.height * 0.06,
        ),
        Container(
            height: size.height / 14,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Get.to(() => Home());
                },
                child: Text(
                  "Done",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))),
      ],
    )));
  }
}
