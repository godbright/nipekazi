import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/MarketPlace/Views/single_product.dart';
import 'package:nipekazi/Posts/Controllers/post_controller.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Service/constats.dart';
import 'package:nipekazi/Widgets/heading.dart';
import 'package:nipekazi/Widgets/limited_text.dart';
import 'package:nipekazi/Widgets/search.dart';
import 'package:nipekazi/constants/colors.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  PostController postController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: HeadingWidget(
          title: "MarketPlace",
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(1),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                child: SearchWidget(),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 20),
                  itemCount: postController.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => Products(
                              id: postController.posts[index].id,
                              descr: postController.posts[index].description,
                              image: postController.posts[index].image == " "
                                  ? image_url +
                                      postController.posts[index].image
                                  : image_url + "1686201304.png",
                              title: postController.posts[index].postName,
                              comment: postController.posts[index].comments,
                            ));
                        setState(() {});
                      },
                      child: Container(
                          child: Column(children: [
                        Container(
                          width: size
                              .width, // Adjust the width property as per your requirement
                          height: 80,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              postController.posts[index].image == " "
                                  ? image_url +
                                      postController.posts[index].image
                                  : image_url +
                                      "1686201304.png", // Replace with your network image URL

                              fit: BoxFit
                                  .cover, // Adjust the fit property as per your requirement
                            ),
                          ),
                        ),
                        Text(
                          postController.posts[index].postName,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: wordColors),
                        ),
                        SizedBox(height: size.height * 0.003),
                        LimitedText(
                            originalText:
                                postController.posts[index].description,
                            wordLimit: 10),
                      ])),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
