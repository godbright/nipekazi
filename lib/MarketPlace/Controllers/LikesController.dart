import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/MarketPlace/Model/CommentsModel.dart';
import 'package:nipekazi/MarketPlace/Model/LikesModel.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Posts/Views/DonePost.dart';

import 'package:nipekazi/Service/api.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikesController extends GetxController {
  var loading = false.obs;
  var token = "".obs;
  var like = {}.obs;

  @override
  void onInit() {
    loading.value = false;
    getToken();
    super.onInit();
  }

  successMessage(msg) {
    Get.snackbar(
      "Message",
      msg,
      colorText: Colors.white,
      backgroundColor: secondaryColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  errorMessage(msg) {
    Get.snackbar(
      "Message",
      msg,
      colorText: Colors.white,
      backgroundColor: secondaryColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token.value = localStorage.getString('token')!;
  }

  getLikes(id) async {
    try {
      loading.value = true;
      var res = await CallApi().getData("like/all/$id", token);

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 0) {
        loading.value = false;
        like.value = jsonResponse; // Assign it to your variable
        print("likes");
        print(jsonResponse); //
      }
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }

  postLike(id) async {
    loading.value = true;

    try {
      var response = await CallApi().getData("like/add/$id", token);
      // getAppointments();
      loading.value = false;
      var jsonResponse = json.decode(response.body);

      if (jsonResponse["status"] == 2) {
        // Get.to(() => DonePost());
        successMessage(jsonResponse["message"]);
        getLikes(id);
      } else {
        errorMessage(jsonResponse["message"]);
      }
    } catch (e) {
      print(e);
      successMessage("Please check your network");
      loading.value = false;
    }
  }

  postunLike(id) async {
    loading.value = true;

    try {
      var response = await CallApi().getData("like/delete/$id", token);
      // getAppointments();
      loading.value = false;
      var jsonResponse = json.decode(response.body);

      if (jsonResponse["status"] == 2) {
        // Get.to(() => DonePost());
        successMessage(jsonResponse["message"]);
        getLikes(id);
      } else {
        errorMessage(jsonResponse["message"]);
      }
    } catch (e) {
      print(e);
      successMessage("Please check your network");
      loading.value = false;
    }
  }
}
