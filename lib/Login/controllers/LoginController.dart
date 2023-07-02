import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nipekazi/Home/views/Home.dart';
import 'package:nipekazi/Service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var user = {}.obs;
  var isloading = false.obs;
  @override
  void onInit() {
    // getUser();
    super.onInit();
  }

  _showMsg(msg) {
    //

    Get.snackbar("Message", msg,
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 0, 98, 179),
        snackPosition: SnackPosition.BOTTOM);
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  login(data) async {
    isloading.value = true;
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      debugPrint(body['token']);
      debugPrint(body['message']);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['data']));
      localStorage.setString('patient', json.encode(body['patient']));
      getUser();
      isloading.value = false;
      Get.offAll(() => Home());
    } else {
      isloading.value = false;
      _showMsg(body['message']);
    }
  }

  getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userObject = localStorage.getString('user')!;
    user.value = json.decode(userObject);
  }
}
