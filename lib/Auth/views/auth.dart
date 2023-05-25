import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Onboarding/views/language.dart';
import 'package:nipekazi/Onboarding/views/onboarding.dart';
import 'package:nipekazi/Registration/views/registration.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isloggedin = false;

  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  _checkLoginStatus() async {
    isloggedin = false;
  }

  @override
  Widget build(BuildContext context) {
    //in this page we will check the logiin status of the user
    return Scaffold(body: isloggedin ? Home() : Language());
  }
}
