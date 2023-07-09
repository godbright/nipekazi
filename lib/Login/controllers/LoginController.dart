import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Service/api.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var user = {}.obs;
  var isloading = false.obs;
  var name = "".obs;
  @override
  void onInit() {
    // getUser();
    super.onInit();
  }

  _showMsg(msg) {
    //

    Get.snackbar("Message", msg,
        colorText: Colors.white,
        backgroundColor: secondaryColor,
        snackPosition: SnackPosition.BOTTOM);
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  login(data) async {
    isloading.value = true;
    print(data);
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);

    if (body['status'] == 0) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']["token"]));
      localStorage.setString('user', json.encode(body['data']));
      isloading.value = false;
      _showMsg(body['message']);
      Get.offAll(() => Home());
    } else {
      _showMsg(body['message']);
      isloading.value = false;
    }
  }

  getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userObject = localStorage.getString('user')!;
    user.value = json.decode(userObject);
  }
}
