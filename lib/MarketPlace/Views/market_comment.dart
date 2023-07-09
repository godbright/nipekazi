import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/MarketPlace/Controllers/CommentsController.dart';
import 'package:nipekazi/MarketPlace/Controllers/LikesController.dart';
import 'package:nipekazi/MarketPlace/Views/single_product.dart';
import 'package:nipekazi/Posts/Controllers/post_controller.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Service/constats.dart';
import 'package:nipekazi/Widgets/heading.dart';
import 'package:nipekazi/Widgets/limited_text.dart';
import 'package:nipekazi/Widgets/search.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:date_format/date_format.dart';

class MarketComment extends StatefulWidget {
  int id;
  String descr;
  String title;
  String comment;
  MarketComment(
      {super.key,
      required this.id,
      required this.descr,
      required this.title,
      required this.comment});

  @override
  State<MarketComment> createState() => _MarketCommentState();
}

class _MarketCommentState extends State<MarketComment> {
  TextEditingController comment_controller = TextEditingController();
  PostController postController = Get.find();
  CommentController commentController = Get.find();
  LikesController likesController = Get.find();
  bool stopped = false;
  postComment() {
    var data = {"comment": comment_controller.text, "post_id": this.widget.id};

    commentController.postComment(data, this.widget.id);

    comment_controller.text = " ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(),
        title: HeadingWidget(
          title: "MarketPlace",
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(1),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/bag.png",
                      height: 10,
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(widget.title, style: GoogleFonts.poppins())
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/comment_icon.png",
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      "   ${commentController.comments.length} comments",
                      style: GoogleFonts.poppins(),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/profile.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.1,
                    child: TextField(
                      onChanged: (value) => {
                        setState(() {
                          stopped = true;
                        })
                      },
                      controller: comment_controller,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: null,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: secondaryColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: secondaryColor),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        focusColor: secondaryColor,
                        hintText: 'Write a comment',
                      ),
                    ),
                  ),
                ],
              ),
              stopped
                  ? GestureDetector(
                      onTap: () {
                        postComment();
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: size.height / 16,
                            width: size.width * 0.4,
                            margin: EdgeInsets.only(bottom: 20, top: 1),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: commentController.loading.value == true
                                    ? CircularProgressIndicator(
                                        color: whiteColor,
                                      )
                                    : Text(
                                        "Post Comment",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ))),
                      ))
                  : Container(),
              Obx(() {
                return Container(
                    height: size.height,
                    width: size.width,
                    child: commentController.loading.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: secondaryColor,
                          ))
                        : commentController.comments.length == 0
                            ? Text(
                                "No comments",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: wordColors),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: commentController.comments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/profile.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${commentController.comments[index].createdBy.fName}  ${commentController.comments[index].createdBy.lName}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: wordColors),
                                                  ),
                                                  Text(
                                                    formatDate(
                                                        commentController
                                                            .comments[index]
                                                            .createdAt,
                                                        [
                                                          yyyy,
                                                          " ",
                                                          MM,
                                                          '  ',
                                                          'at',
                                                          '  ',
                                                          HH,
                                                          ':',
                                                          nn,
                                                        ]),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.08,
                                        ),
                                        Image.asset(
                                          "assets/menu.png",
                                          height: 20,
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    LimitedText(
                                        originalText: commentController
                                            .comments[index].comment,
                                        wordLimit: 15),
                                    postController.posts[index].image == ""
                                        ? SizedBox(
                                            height: 1,
                                          )
                                        : Container(
                                            width: size
                                                .width, // Adjust the width property as per your requirement
                                            height: 80,

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                image_url +
                                                    postController.posts[index]
                                                        .image, // Replace with your network image URL

                                                fit: BoxFit
                                                    .cover, // Adjust the fit property as per your requirement
                                              ),
                                            ),
                                          ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Talk to the owner",
                                            style: GoogleFonts.poppins(
                                                color: greyColor),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  likesController
                                                      .postLike(this.widget.id);
                                                },
                                                child: Image.asset(
                                                  "assets/like.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                likesController.like["data"]
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: greyColor,
                                                    fontSize: 11),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    )
                                  ]));
                                },
                              ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
