import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nipekazi/Posts/Controllers/post_controller.dart';
import 'package:nipekazi/Posts/Views/DonePost.dart';
import 'package:nipekazi/constants/colors.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool isloading = false;
  TextEditingController product_Controller = TextEditingController();
  TextEditingController descr_Controller = TextEditingController();

  XFile? image;
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
// Function to pick an image from camera or gallery
  Future<void> getImage(ImageSource media) async {
    final XFile? img = await picker.pickImage(source: media);

    if (img != null) {
      setState(() {
        image = img;
      });

      // Obtain base64-encoded image
      List<int> imageBytes = await img.readAsBytes();
      base64Image = base64Encode(imageBytes);

      // Use the base64Image as needed
      print(base64Image);
    } else {
      // Handle the case when no image is picked
      print('No image selected');
    }
  }

  void clearImage() {
    setState(() {
      image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    PostController postController = Get.find();

    postProduct() {
      var data = {
        "post_name": product_Controller.text,
        "description": descr_Controller.text,
        "image": base64Image
      };

      postController.postUpdate(data, "post/create");
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset("assets/back_arrow.png",
                      width: size.width * 0.05, height: size.height * 0.12),
                ),
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
            GestureDetector(
              onTap: () {
                getImage(ImageSource.gallery);
              },
              child: image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                        ),
                      ),
                    )
                  : Image.asset("assets/camera.png",
                      width: size.width * 0.15, height: size.height * 0.1),
            ),
            image != null
                ? Text("")
                : Text(
                    "Upload Photo",
                    style: GoogleFonts.poppins(color: secondaryColor),
                  ),
            SizedBox(
              height: size.height * 0.01,
            ),
            image != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          clearImage();
                          getImage(ImageSource.gallery);
                        },
                        child: Text(
                          "Change",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          clearImage();
                        },
                        child: Text(
                          "Remove",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : Container(),
            SizedBox(
              height: size.height * 0.01,
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
                setState(() {
                  isloading = true;
                });
                postProduct();
              }),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: size.height / 16,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: isloading
                      ? CircularProgressIndicator(
                          color: whiteColor,
                        )
                      : Text("Post",
                          style: GoogleFonts.poppins(
                              color: whiteColor, fontSize: 15)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
