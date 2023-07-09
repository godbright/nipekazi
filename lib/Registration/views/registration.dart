// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Login/View/Login.dart';
import 'package:nipekazi/Registration/controllers/RegistrationController.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  RegisterController regController = Get.find();
  bool value = false;
  bool isvisible = false;
  TextEditingController fname_Controller = TextEditingController();
  TextEditingController lname_Controller = TextEditingController();
  String phone_Controller = "";
  TextEditingController pass_Controller = TextEditingController();
  TextEditingController mail_Controller = TextEditingController();
  bool isloading = false;

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0XFFDB0000),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register() async {
    print("called");
    var data = {
      'f_name': fname_Controller.text,
      'l_name': lname_Controller.text,
      'phone': phone_Controller,
      'password': pass_Controller.text,
    };

    await regController.registerUser(data);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: size.height * 0.1, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                    color: wordColors,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                IntlPhoneField(
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
                  onChanged: (phone) {
                    phone_Controller = phone.completeNumber;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  controller: fname_Controller,
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
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  controller: lname_Controller,
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
                    hintText: 'Second Name',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                    controller: pass_Controller,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: secondaryColor),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          icon: isvisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Password")),
                SizedBox(
                  height: size.height / 80,
                ),

                SizedBox(
                  height: size.height / 70,
                ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your Last Name';
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                //     filled: true,
                //     fillColor: Colors.white,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     hintText: 'Last Name',
                //   ),
                // ),
                Row(
                  children: [
                    Checkbox(
                      // ignore: unnecessary_this
                      value: this.value,
                      onChanged: ((value) {}),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "I accept",
                    //       style: GoogleFonts.poppins(color: blackColor),
                    //     )
                    //   ],
                    // ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'I accept ',
                        style: GoogleFonts.poppins(color: Color(0XFF666666)),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions.',
                        style: GoogleFonts.poppins(
                            color: secondaryColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            print("object");
                            const url =
                                'http://multagentgas.com/terms-and-conditions';
                            try {
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                print('Could not launch $url');
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                      ),
                    ]))
                  ],
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                // ignore: avoid_unnecessary_containers
                regController.isloading.value == true
                    ? Container(
                        height: size.height / 16,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextButton(
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Loading  ",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  // CircularProgressIndicator(

                                  // )
                                ],
                              ),
                            )),
                      )
                    : GestureDetector(
                        onTap: () {
                          _register();
                        },
                        child: Container(
                          height: size.height / 16,
                          width: size.width / 1,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: regController.isloading.value == false
                                ? Text(
                                    "Sign Up",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 17),
                                  )
                                : CircularProgressIndicator(
                                    color: whiteColor, strokeWidth: 3),
                          ),
                        ),
                      ),
                SizedBox(
                  height: size.height / 70,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const Login());
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.poppins(color: Color(0XFF979797)),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: GoogleFonts.poppins(
                          color: secondaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  ])),
                )
              ],
            ),
          ),
        ));
  }
}
