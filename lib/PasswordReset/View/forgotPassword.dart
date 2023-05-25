import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/PasswordReset/View/enterCode.dart';
import 'package:nipekazi/constants/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    String phone_Controller = "";

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Image.asset(
            "assets/pass.png",
            height: size.height * 0.4,
            width: size.width * 0.9,
          ),
        ),
        Text(
          "Reset Password",
          style: GoogleFonts.poppins(
              color: wordColors, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 25,
          ),
          child: Text(
            "Just enter the Phone number you registered with and we’ll send you a code to reset your password. ",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: IntlPhoneField(
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
        ),
        Container(
            height: size.height / 14,
            width: size.width / 1.3,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Get.to(() => EnterCode());
                },
                child: Text(
                  "Send Code",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))),
      ],
    )));
  }
}
