import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/MarketPlace/Views/single_product.dart';
import 'package:nipekazi/Posts/Model/Post.dart';
import 'package:nipekazi/Widgets/heading.dart';
import 'package:nipekazi/Widgets/limited_text.dart';
import 'package:nipekazi/Widgets/search.dart';
import 'package:nipekazi/constants/colors.dart';

class MarketComment extends StatefulWidget {
  const MarketComment({super.key});

  @override
  State<MarketComment> createState() => _MarketCommentState();
}

class _MarketCommentState extends State<MarketComment> {
  List<Post> posts = [
    Post(
      description:
          'Nataka Jordan ya kupanda iliyo na ubora wa hali ya juu, namba ya ukubwa 10, rangi nyeusi au kijivu, inayofaa kwa matumizi ya kawaida na shughuli za kupanda milima. Ninapendelea kiatu ambacho kina teknolojia ya hali ya juu kama vile kinga ya maji, kinga ya toe, na tabaka ya ziada ya ulinzi dhidi ya mawe na vikwazo vingine vya asili. Tafadhali nionyeshe chaguzi zote za Jordan ya kupanda ambazo zinafaa mahitaji yangu. Ikiwa kuna brandi fulani ya Jordan ambayo ni maarufu kwa ubora na utendaji bora katika kupanda milima, tafadhali nishauri juu yake. Pia, ikiwa kuna vifaa vingine kama soksi maalum za kupanda milima ambazo zinaweza kuambatana na viatu hivi, tafadhali nionyeshe pia.Natarajia kupata maelezo kamili na picha za kiatu, pamoja na bei na maelezo ya muuzaji. Asante sana!',
      image: "assets/code.png",
      title: 'Nahitaji Air Jordan ya kupanda',
      comments: 20,
    ),
    Post(
        description:
            'Nataka Jordan ya kupanda iliyo na ubora wa hali ya juu, namba ya ukubwa 10, rangi nyeusi au kijivu, inayofaa kwa matumizi ya kawaida na shughuli za kupanda milima. Ninapendelea kiatu ambacho kina teknolojia ya hali ya juu kama vile kinga ya maji, kinga ya toe, na tabaka ya ziada ya ulinzi dhidi ya mawe na vikwazo vingine vya asili. Tafadhali nionyeshe chaguzi zote za Jordan ya kupanda ambazo zinafaa mahitaji yangu. Ikiwa kuna brandi fulani ya Jordan ambayo ni maarufu kwa ubora na utendaji bora katika kupanda milima, tafadhali nishauri juu yake. Pia, ikiwa kuna vifaa vingine kama soksi maalum za kupanda milima ambazo zinaweza kuambatana na viatu hivi, tafadhali nionyeshe pia.Natarajia kupata maelezo kamili na picha za kiatu, pamoja na bei na maelezo ya muuzaji. Asante sana!',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Nataka Jordan ya kupanda iliyo na ubora wa hali ya juu, namba ya ukubwa 10, rangi nyeusi au kijivu, inayofaa kwa matumizi ya kawaida na shughuli za kupanda milima. Ninapendelea kiatu ambacho kina teknolojia ya hali ya juu kama vile kinga ya maji, kinga ya toe, na tabaka ya ziada ya ulinzi dhidi ya mawe na vikwazo vingine vya asili. Tafadhali nionyeshe chaguzi zote za Jordan ya kupanda ambazo zinafaa mahitaji yangu. Ikiwa kuna brandi fulani ya Jordan ambayo ni maarufu kwa ubora na utendaji bora katika kupanda milima, tafadhali nishauri juu yake. Pia, ikiwa kuna vifaa vingine kama soksi maalum za kupanda milima ambazo zinaweza kuambatana na viatu hivi, tafadhali nionyeshe pia.Natarajia kupata maelezo kamili na picha za kiatu, pamoja na bei na maelezo ya muuzaji. Asante sana!',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Nataka Jordan ya kupanda iliyo na ubora wa hali ya juu, namba ya ukubwa 10, rangi nyeusi au kijivu, inayofaa kwa matumizi ya kawaida na shughuli za kupanda milima. Ninapendelea kiatu ambacho kina teknolojia ya hali ya juu kama vile kinga ya maji, kinga ya toe, na tabaka ya ziada ya ulinzi dhidi ya mawe na vikwazo vingine vya asili. Tafadhali nionyeshe chaguzi zote za Jordan ya kupanda ambazo zinafaa mahitaji yangu. Ikiwa kuna brandi fulani ya Jordan ambayo ni maarufu kwa ubora na utendaji bora katika kupanda milima, tafadhali nishauri juu yake. Pia, ikiwa kuna vifaa vingine kama soksi maalum za kupanda milima ambazo zinaweza kuambatana na viatu hivi, tafadhali nionyeshe pia.Natarajia kupata maelezo kamili na picha za kiatu, pamoja na bei na maelezo ya muuzaji. Asante sana!',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
    Post(
        description:
            'Nataka Jordan ya kupanda iliyo na ubora wa hali ya juu, namba ya ukubwa 10, rangi nyeusi au kijivu, inayofaa kwa matumizi ya kawaida na shughuli za kupanda milima. Ninapendelea kiatu ambacho kina teknolojia ya hali ya juu kama vile kinga ya maji, kinga ya toe, na tabaka ya ziada ya ulinzi dhidi ya mawe na vikwazo vingine vya asili. Tafadhali nionyeshe chaguzi zote za Jordan ya kupanda ambazo zinafaa mahitaji yangu. Ikiwa kuna brandi fulani ya Jordan ambayo ni maarufu kwa ubora na utendaji bora katika kupanda milima, tafadhali nishauri juu yake. Pia, ikiwa kuna vifaa vingine kama soksi maalum za kupanda milima ambazo zinaweza kuambatana na viatu hivi, tafadhali nionyeshe pia.Natarajia kupata maelezo kamili na picha za kiatu, pamoja na bei na maelezo ya muuzaji. Asante sana!',
        image: "assets/code.png",
        title: 'Nahitaji Air Jordan ya kupanda',
        comments: 20),
  ];

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
              Container(
                height: size.height,
                width: size.width,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 20),
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
                      child: Container(
                          child: Column(children: [
                        Container(
                          width: size
                              .width, // Adjust the width property as per your requirement
                          height: 80,

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
