import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Widgets/heading.dart';
import 'package:nipekazi/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(),
        title: HeadingWidget(
          title: "Notifications",
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(1),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You have 10 notifications today ",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w300, color: wordColors),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Today",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600, color: wordColors),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/profile.png",
                  height: 60,
                  width: 60,
                ),
                Column(
                  children: [
                    Text(
                      "Amina commented on your post",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: wordColors),
                    ),
                    Text(
                      "Hi is there anything we can talk ...",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: wordColors),
                    ),
                  ],
                ),
                Text(
                  "2 Hrs Ago",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: wordColors),
                ),
                Divider(
                  thickness: 100,
                  height: 100,
                  color: greenColor,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
