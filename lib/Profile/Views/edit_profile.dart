import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Auth/views/auth.dart';
import 'package:nipekazi/Login/controllers/LoginController.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  Map<String, dynamic>? user;
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone_c = TextEditingController();
  TextEditingController email = TextEditingController();
  LoginController loginController = Get.find();
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    fname = TextEditingController(text: loginController.user["f_name"]);
    lname = TextEditingController(text: loginController.user["l_name"]);
    phone_c = TextEditingController(text: loginController.user["phone"]);
  }

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: (() => Get.back()),
                      child: Image.asset("assets/back_arrow.png",
                          width: size.width * 0.05, height: size.height * 0.12),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    " Profile",
                    style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                      height: size.height * 0.14,
                      width: size.width,
                      child: GestureDetector(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: image != null
                            ? Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                      top: 0,
                                      left: size.width * 0.25,
                                      bottom: 0,
                                      child: Container(
                                          width: size.width * 0.3,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.file(
                                              //to show image, you type like this.
                                              File(image!.path),
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 300,
                                            ),
                                          ))),
                                ],
                              )
                            : Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                      top: 0,
                                      left: size.width * 0.25,
                                      bottom: 0,
                                      child: Container(
                                        width: size.width * 0.28,
                                        child: Image.asset(
                                          "assets/sample_person.png",
                                          height: size.height * 0.04,
                                        ),
                                      )),
                                  Positioned(
                                      top: size.height * 0.1,
                                      left: size.width * 0.45,
                                      child: Image.asset(
                                        "assets/edit.png",
                                        height: size.height * 0.035,
                                      ))
                                ],
                              ),
                      )),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: fname,
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
                      hintText: 'First Name',
                      labelText: "First Name",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: lname,
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
                      hintText: 'Last Name',
                      labelText: "Last Name",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  IntlPhoneField(
                    controller: phone_c,
                    disableLengthCheck: true,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.grey.shade100,
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down,
                      color: blackColor,
                    ),
                    flagsButtonPadding: EdgeInsets.all(size.height / 60),
                    dropdownIconPosition: IconPosition.trailing,
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
                      hintText: 'Phone Number',
                    ),
                    initialCountryCode: 'TZ',
                    onChanged: (phone) {},
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: (() {}),
                    child: Container(
                      height: size.height / 16,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: secondaryColor,
                            width: 1,
                          )),
                      child: Center(
                        child: Text("Save",
                            style: GoogleFonts.poppins(color: secondaryColor)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (() async {
                      setState(() {
                        isloading = true;
                      });

                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.clear();

                      if (localStorage.getString('user') == null) {
                        Get.offAll(() => const Auth());
                      }
                    }),
                    child: Container(
                      height: size.height / 16,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Log out",
                            style: GoogleFonts.poppins(color: whiteColor)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
