import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Login/View/Login.dart';
import 'package:nipekazi/constants/colors.dart';

class DonePassword extends StatefulWidget {
  const DonePassword({super.key});

  @override
  State<DonePassword> createState() => _DonePasswordState();
}

class _DonePasswordState extends State<DonePassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Image.asset(
            "assets/done.png",
            height: size.height * 0.4,
            width: size.width * 0.9,
          ),
        ),
        Text(
          "Congratulations",
          style: GoogleFonts.poppins(
              color: wordColors, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, bottom: 10),
          child: Text(
            "You have successfully change the password. Get back to your account now",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
        ),
        Container(
            height: size.height / 14,
            width: size.width / 1.3,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Get.to(() => Login());
                },
                child: Text(
                  "Sign in",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))),
      ],
    )));
  }
}
