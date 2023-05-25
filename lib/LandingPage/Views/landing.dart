import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/constants/colors.dart';

import '../../Posts/Model/Post.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController search_controller = TextEditingController();

  List<Post> posts = [
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image:
            'https://assets.hermes.com/is/image/hermesproduct/quicker-sneaker--102190ZH09-worn-1-0-0-800-800_g.jpg',
        title: 'Nahitaji Air Jordan ya kupanda'),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image:
            'https://assets.hermes.com/is/image/hermesproduct/quicker-sneaker--102190ZH09-worn-1-0-0-800-800_g.jpg',
        title: 'Nahitaji Air Jordan ya kupanda'),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image:
            'https://assets.hermes.com/is/image/hermesproduct/quicker-sneaker--102190ZH09-worn-1-0-0-800-800_g.jpg',
        title: 'Nahitaji Air Jordan ya kupanda'),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image:
            'https://assets.hermes.com/is/image/hermesproduct/quicker-sneaker--102190ZH09-worn-1-0-0-800-800_g.jpg',
        title: 'Nahitaji Air Jordan ya kupanda'),
    Post(
        description:
            'Natafuta magauni, sketi, tshirts na mashati ya kiume ya mtumba size large',
        image:
            'https://assets.hermes.com/is/image/hermesproduct/quicker-sneaker--102190ZH09-worn-1-0-0-800-800_g.jpg',
        title: 'Nahitaji Air Jordan ya kupanda'),
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: TextFormField(
                  controller: search_controller,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
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
                    hintText: 'What are you looking for?',
                  ),
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
                  "What are you looking for?",
                  style: GoogleFonts.poppins(
                    color: lightgrey,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                height: size.height,
                width: size.width,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 135.0,
                      crossAxisSpacing: 20),
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            width:
                                200, // Specify the desired width of the container
                            height:
                                200, // Specify the desired height of the container
                            child: Image.network(
                              posts[index]
                                  .image, // Replace with your network image URL
                              fit: BoxFit
                                  .contain, // Adjust the fit property as per your requirement
                            ),
                          ),
                          Text(
                            posts[index].title,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: wordColors),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            posts[index].description,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
