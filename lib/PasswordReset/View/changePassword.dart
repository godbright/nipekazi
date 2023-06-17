import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nipekazi/PasswordReset/View/donePassword.dart';
import 'package:nipekazi/constants/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    String phone_Controller = "";
    TextEditingController pass_Controller = TextEditingController();
    bool isvisible = false;

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Image.asset(
              "assets/enterpass.png",
              height: size.height * 0.4,
              width: size.width * 0.9,
            ),
          ),
          Text(
            "Change Password",
            style: GoogleFonts.poppins(
                color: wordColors, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Text(
              "Setup new password to secure your account  ",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: TextFormField(
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
          ),
          Container(
              height: size.height / 14,
              width: size.width / 1.3,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => DonePassword());
                  },
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ))),
        ],
      )),
    ));
  }
}
