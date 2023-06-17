import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/constants/colors.dart';

class HeadingWidget extends StatelessWidget {
  String title;
  HeadingWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
              color: wordColors, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
