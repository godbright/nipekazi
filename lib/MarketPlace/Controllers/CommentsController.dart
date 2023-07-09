import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/MarketPlace/Model/CommentsModel.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Posts/Views/DonePost.dart';

import 'package:nipekazi/Service/api.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentController extends GetxController {
  var loading = false.obs;
  var token = "".obs;
  var comments = <Comment>[].obs;

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

  getComments(id) async {
    try {
      loading.value = true;
      var res = await CallApi().getData("comment/list/$id", token);

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 1) {
        loading.value = false;
        var dataArray = jsonResponse['data']
            ["comments"]; // Access the 'data' array directly
        print(jsonResponse);
        comments.value = commentFromJson(
            json.encode(dataArray)); // Assign it to your variable
      }
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }

  postComment(data, id) async {
    loading.value = true;

    try {
      var response = await CallApi().postData(data, "comment/send", token);
      // getAppointments();
      loading.value = false;
      var jsonResponse = json.decode(response.body);

      if (jsonResponse["status"] == 0) {
        // Get.to(() => DonePost());
        successMessage(jsonResponse["message"]);
        getComments(id);
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
