import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/back_arrow.png",
            width: size.width, height: size.height),
        title: Text(
          "Post what you need",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(children: [
          Image.asset("assets/camera.png",
              width: size.width, height: size.height),
          Text(
            "Upload Photo",
            style: GoogleFonts.poppins(),
          )
        ]),
      ),
    );
  }
}
