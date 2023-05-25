import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Login/View/Login.dart';
import 'package:nipekazi/Onboarding/views/onboarding.dart';
import 'package:nipekazi/constants/colors.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isSwahili = false;
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
            "assets/lang.png",
            height: size.height * 0.4,
            width: size.width * 0.9,
          ),
        ),
        Text(
          "Language",
          style: GoogleFonts.poppins(
              color: wordColors, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
          child: Text(
            "Change Language",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: size.height / 14,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color: isSwahili ? secondaryColor : whiteColor,
                    border: Border.all(
                      color: !isSwahili ? secondaryColor : whiteColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSwahili = !isSwahili;
                      });
                      Get.to(() => Onboarding());
                    },
                    child: Text(
                      "English",
                      style: GoogleFonts.poppins(
                          color: !isSwahili ? secondaryColor : Colors.white),
                    ))),
            SizedBox(
              width: 10,
            ),
            Container(
                height: size.height / 14,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color: !isSwahili ? secondaryColor : whiteColor,
                    border: Border.all(
                      color: isSwahili ? secondaryColor : whiteColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSwahili = !isSwahili;
                      });
                      Get.to(() => Onboarding());
                    },
                    child: Text(
                      "Swahili",
                      style: GoogleFonts.poppins(
                          color: isSwahili ? secondaryColor : Colors.white),
                    ))),
          ],
        ),
      ],
    )));
  }
}
