import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/MarketPlace/Controllers/CommentsController.dart';
import 'package:nipekazi/MarketPlace/Controllers/LikesController.dart';
import 'package:nipekazi/MarketPlace/Views/market_comment.dart';
import 'package:nipekazi/constants/colors.dart';

class Products extends StatefulWidget {
  int id;
  String image;
  String title;
  String descr;
  String comment;
  Products({
    super.key,
    required this.id,
    required this.descr,
    required this.image,
    required this.title,
    required this.comment,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CommentController commentController = Get.find();
    LikesController likeController = Get.find();
    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width, // Specify the desired width of the container
              height: size.height *
                  0.5, // Specify the desired height of the container
              child: Image.network(
                widget.image, // Replace with your network image URL
                fit: BoxFit
                    .contain, // Adjust the fit property as per your requirement
              ),
            ),
            Positioned(
              left: 20,
              child: GestureDetector(
                onTap: (() => Get.back()),
                child: Image.asset("assets/back_arrow.png",
                    width: size.width * 0.05, height: size.height * 0.12),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                height: size.height * 0.55,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: wordColors),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Image.asset("assets/message.png",
                              width: size.width * 0.04,
                              height: size.height * 0.05),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.comment.toString() + " Comments",
                            style: GoogleFonts.poppins(color: secondaryColor),
                          )
                        ],
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: wordColors),
                      ),
                      SizedBox(
                        width: size.width * 0.9,
                        child: Text(
                          widget.descr,
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 12,
              right: 12,
              child: Align(
                child: GestureDetector(
                  onTap: (() {
                    likeController.getLikes(this.widget.id);
                    commentController.getComments(this.widget.id);

                    Get.to(MarketComment(
                        id: widget.id,
                        title: widget.title,
                        descr: widget.descr,
                        comment: widget.comment));
                  }),
                  child: Container(
                      height: size.height / 14,
                      width: size.width * 0.9,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Comment",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
