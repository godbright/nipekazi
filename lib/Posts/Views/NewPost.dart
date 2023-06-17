import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Posts/Views/DonePost.dart';
import 'package:nipekazi/constants/colors.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController product_Controller = TextEditingController();
    TextEditingController descr_Controller = TextEditingController();

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(size.height * 0.1),
      //   child: AppBar(
      //     leading: Image.asset("assets/back_arrow.png",
      //         width: size.width * 0.1, height: size.height * 0.1),
      //     title: Text(
      //       "Post what you need",
      //       style: GoogleFonts.poppins(
      //           fontWeight: FontWeight.w600, color: wordColors, fontSize: 20),
      //     ),
      //     backgroundColor: whiteColor,
      //     elevation: 0,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/back_arrow.png",
                    width: size.width * 0.05, height: size.height * 0.12),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Text(
                  "Post what you need",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: wordColors,
                      fontSize: 20),
                )
              ],
            ),
            Image.asset("assets/camera.png",
                width: size.width * 0.15, height: size.height * 0.1),
            Text(
              "Upload Photo",
              style: GoogleFonts.poppins(color: secondaryColor),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Je unahitaji nini?",
              style: GoogleFonts.poppins(color: wordColors),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              controller: product_Controller,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: secondaryColor),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                filled: true,
                fillColor: Colors.grey.shade100,
                focusColor: secondaryColor,
                hintText: '“Nahitaji Airjordan 5 ya kupanda”',
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Maelezo zaidi",
              style: GoogleFonts.poppins(color: wordColors),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              controller: descr_Controller,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              minLines: 4,
              maxLines: null,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: secondaryColor),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                filled: true,
                fillColor: Colors.grey.shade100,
                focusColor: secondaryColor,
                hintText: '““Nahitaji hiki kiatu kiwe kipya napatikana kimara”',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
              onTap: (() {
                Get.to(() => DonePost());
              }),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: size.height / 16,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text("Post",
                      style:
                          GoogleFonts.poppins(color: whiteColor, fontSize: 15)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
