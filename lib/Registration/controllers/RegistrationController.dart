import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Service/api.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  var isloading = false.obs;
  _showMsg(msg) {
    //

    Get.snackbar("Message", msg,
        colorText: Colors.white,
        backgroundColor: secondaryColor,
        snackPosition: SnackPosition.BOTTOM);
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  registerUser(data) async {
    isloading.value = true;
    try {
      var res = await CallApi().postData(data, 'register');
      var body = json.decode(res.body);

      if (body['status'] == 0) {
        isloading.value = false;
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']["token"]));
        localStorage.setString('user', json.encode(body['data']));
        Get.offAll(() => Home());
      } else {
        isloading.value = false;
        _showMsg(body["message"]);
      }
    } catch (e) {
      print(e);
      // print(e);
      isloading.value = false;
      _showMsg("Invalid Input");
    }
  }
}
