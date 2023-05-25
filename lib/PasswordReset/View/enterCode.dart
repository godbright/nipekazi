import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/PasswordReset/View/changePassword.dart';
import 'package:nipekazi/constants/colors.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({super.key});

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
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
            "assets/code.png",
            height: size.height * 0.4,
            width: size.width * 0.9,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 25,
          ),
          child: Text(
            "Verification code has been sent to your phone number",
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Resend code in 50s",
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
                  Get.to(() => ChangePassword());
                },
                child: Text(
                  "Verify",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))),
      ],
    )));
  }
}
