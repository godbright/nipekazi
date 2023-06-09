import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Posts/Views/DonePost.dart';

import 'package:nipekazi/Service/api.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  var loading = false.obs;
  var token = "".obs;
  var posts = <Post>[].obs;
  var personal_posts = <Post>[].obs;

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

  getPosts() async {
    try {
      loading.value = true;
      var res = await CallApi().getData("post/list", token);

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 0) {
        var dataArray =
            jsonResponse['data']; // Access the 'data' array directly
        posts.value =
            postFromJson(json.encode(dataArray)); // Assign it to your variable
      }
      loading.value = false;
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }

  getPostByPerson() async {
    try {
      loading.value = true;
      var res = await CallApi().getData("post/my/list", token);

      var jsonResponse = json.decode(res.body); // Parse the response body

      if (jsonResponse['status'] == 0) {
        var dataArray =
            jsonResponse['data']; // Access the 'data' array directly
        personal_posts.value =
            postFromJson(json.encode(dataArray)); // Assign it to your variable
      }
      loading.value = false;
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }

  postUpdate(data, apiUrl) async {
    loading.value = true;

    try {
      var response = await CallApi().postData(data, apiUrl, token);
      // getAppointments();
      loading.value = false;
      var jsonResponse = json.decode(response.body);
      print("the dara");
      print(jsonResponse);

      if (jsonResponse["status"] == 0) {
        Get.to(() => DonePost());
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
