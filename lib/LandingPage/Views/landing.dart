import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/MarketPlace/Views/market_place.dart';
import 'package:nipekazi/MarketPlace/Views/single_product.dart';
import 'package:nipekazi/Widgets/limited_text.dart';
import 'package:nipekazi/Widgets/search.dart';
import 'package:nipekazi/constants/colors.dart';

import '../../Posts/Model/Post.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Post> posts = [
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Godbright",
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      Text(
                        "Get what you need fast",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Icon(Icons.notification_add)
                ],
              ),
              SearchWidget(),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.2, color: Colors.grey),
                ),
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(15),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find what you need without a \n hustle",
                            style: GoogleFonts.poppins(
                                color: wordColors,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              "Explore the marketplace now",
                              style: GoogleFonts.poppins(
                                  color: wordColors,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Get.to(() => MarketPlace());
                            }),
                            child: Container(
                              height: size.height / 16,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: purpleColor),
                              child: Center(
                                child: Text(
                                  "Market Place",
                                  style: GoogleFonts.poppins(color: whiteColor),
                                ),
                              ),
                            ),
                          )
                        ]),
                    Positioned(
                      top: -40,
                      left: size.width * 0.35,
                      child: Image.asset(
                        "assets/cofee.png",
                        width: size.width * 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Trending now",
                  style: GoogleFonts.poppins(
                    color: lightgrey,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.2, color: Colors.grey),
                ),
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Natafuta Fridge kubwa  la milango \n minne",
                        style: GoogleFonts.poppins(
                            color: wordColors,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.6,
                            height: size.height * 0.16,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: ((context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/profile.png",
                                            width: size.width * 0.18,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3.0),
                                            child: Text(
                                              "Bilson",
                                              style: GoogleFonts.poppins(
                                                  color: wordColors,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '+300 ',
                                style: GoogleFonts.poppins(
                                    color: lightgrey,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Comments',
                                style: GoogleFonts.poppins(
                                  color: wordColors,
                                ),
                              ),
                            ])),
                          )
                        ],
                      )
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What people are looking for",
                  style: GoogleFonts.poppins(
                    color: lightgrey,
                    fontSize: 16,
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: size.height * 0.1, maxHeight: double.infinity),
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10),
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => Products(
                              descr: posts[index].description,
                              image: posts[index].image,
                              title: posts[index].title,
                              comment: posts[index].comments,
                            ));
                        setState(() {});
                      },
                      child: Column(children: [
                        Container(
                          width: size
                              .width, // Adjust the width property as per your requirement
                          height: 90,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              posts[index]
                                  .image, // Replace with your network image URL

                              fit: BoxFit
                                  .cover, // Adjust the fit property as per your requirement
                            ),
                          ),
                        ),
                        Text(
                          posts[index].title,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: wordColors),
                        ),
                        SizedBox(height: size.height * 0.003),
                        LimitedText(
                            originalText: posts[index].description,
                            wordLimit: 4),
                      ]),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
