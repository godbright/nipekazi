import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/Login/View/Login.dart';
import 'package:nipekazi/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Image.asset(
                        "assets/image1.png",
                        height: size.height * 0.4,
                        width: size.width * 0.9,
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(4, 5),
                            )
                          ],
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "Rafiki Yako wa Mawasiliano",
                            style: GoogleFonts.poppins(
                                color: wordColors, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 8),
                            child: Text(
                              "Nihudumie inakuwezesha kujenga mtandao wa watu wanaokusaidia kupata kila unachohitaji. Pata maelezo ya wauzaji, tembelea bidhaa zinazovutia, na kuwasiliana na watumiaji wengine moja kwa moja. ",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: const Alignment(0, 0.55),
                              child: SmoothPageIndicator(
                                effect: SlideEffect(
                                  radius: 100.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  activeDotColor: secondaryColor,
                                  dotColor: Colors.grey,
                                ),
                                controller: _controller,
                                count: 3,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Positioned(
                            bottom: size.height / 15,
                            left: size.width / 8.5,
                            child: Container(
                                height: size.height / 14,
                                width: size.width / 1.3,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextButton(
                                    onPressed: () {
                                      _controller.nextPage(
                                          duration: 300.milliseconds,
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      "Endelea",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Image.asset(
                        "assets/image2.png",
                        height: size.height * 0.4,
                        width: size.width * 0.9,
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(4, 5),
                            )
                          ],
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "Fursa za Kipekee",
                            style: GoogleFonts.poppins(
                                color: wordColors, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 8),
                            child: Text(
                              " Nihudumie inakupa fursa ya kipekee ya kugundua vitu ambavyo hukutegemea. Pata bidhaa zisizopatikana kwa urahisi na kushirikiana na watumiaji wengine ambao wanaweza kukusaidia kutimiza mahitaji yako ",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: const Alignment(0, 0.55),
                              child: SmoothPageIndicator(
                                effect: SlideEffect(
                                  radius: 100.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  activeDotColor: secondaryColor,
                                  dotColor: Colors.grey,
                                ),
                                controller: _controller,
                                count: 3,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Positioned(
                            bottom: size.height / 15,
                            left: size.width / 8.5,
                            child: Container(
                                height: size.height / 14,
                                width: size.width / 1.3,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextButton(
                                    onPressed: () {
                                      _controller.nextPage(
                                          duration: 300.milliseconds,
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      "Endelea",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Image.asset(
                        "assets/image3.png",
                        height: size.height * 0.4,
                        width: size.width * 0.9,
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(4, 5),
                            )
                          ],
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "Rafiki Yako wa Mawasiliano",
                            style: GoogleFonts.poppins(
                                color: wordColors, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 8),
                            child: Text(
                              "Nihudumie inakuwezesha kujenga mtandao wa watu wanaokusaidia kupata kila unachohitaji. Pata maelezo ya wauzaji, tembelea bidhaa zinazovutia, na kuwasiliana na watumiaji wengine moja kwa moja. ",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: const Alignment(0, 0.55),
                              child: SmoothPageIndicator(
                                effect: SlideEffect(
                                  radius: 100.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  activeDotColor: secondaryColor,
                                  dotColor: Colors.grey,
                                ),
                                controller: _controller,
                                count: 3,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Positioned(
                            bottom: size.height / 15,
                            left: size.width / 8.5,
                            child: Container(
                                height: size.height / 14,
                                width: size.width / 1.3,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextButton(
                                    onPressed: () {
                                      Get.offAll(() => Login());
                                    },
                                    child: Text(
                                      "Ingia",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
