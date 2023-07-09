import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:nipekazi/Auth/views/auth.dart';
import 'package:nipekazi/Login/controllers/LoginController.dart';
import 'package:nipekazi/MarketPlace/Controllers/CommentsController.dart';
import 'package:nipekazi/MarketPlace/Controllers/LikesController.dart';
import 'package:nipekazi/Posts/Controllers/post_controller.dart';
import 'package:nipekazi/Registration/controllers/RegistrationController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  LoginController loginController = Get.put(LoginController());
  RegisterController registerController = Get.put(RegisterController());
  PostController postController = Get.put(PostController());
  CommentController commentController = Get.put(CommentController());
  LikesController likesController = Get.put(LikesController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nihudumie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
    );
  }
}
