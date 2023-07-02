// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Login/controllers/LoginController.dart';
import 'package:nipekazi/PasswordReset/View/forgotPassword.dart';
import 'package:nipekazi/Registration/views/registration.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = false;
  bool isvisible = false;
  LoginController loginController = Get.find();
  String phone_Controller = "";
  TextEditingController pass_Controller = TextEditingController();
  bool isloading = false;

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0XFFDB0000),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  login() {
    var data = {
      'email': phone_Controller,
      'password': pass_Controller.text,
      'device_name': "samsung A12",
    };
    loginController.login(data);
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
                  height: size.height * 0.2,
                ),
                Text(
                  "Login in to Your Account",
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
                    controller: pass_Controller,
                    style: const TextStyle(
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

                GestureDetector(
                  onTap: (() => {Get.to(() => ForgotPassword())}),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Forgot the Password ?",
                        style: GoogleFonts.poppins(
                          color: secondaryColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                // ignore: avoid_unnecessary_containers
                isloading
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
                                children: const [
                                  Text(
                                    "Loading",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  // CircularProgressIndicator()
                                ],
                              ),
                            )),
                      )
                    : Container(
                        height: size.height / 16,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isloading = true;
                              Get.offAll(() => Home());
                            });
                            // _register();
                          },
                          child: Text("Sign in",
                              style: GoogleFonts.poppins(
                                  color: whiteColor, fontSize: 15)),
                        ),
                      ),
                SizedBox(
                  height: size.height / 70,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Registration());
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Dont have an account? ',
                      style: GoogleFonts.poppins(color: Color(0XFF979797)),
                    ),
                    TextSpan(
                      text: 'Sign up',
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
