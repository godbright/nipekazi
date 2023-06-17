import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nipekazi/constants/colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search_controller = TextEditingController();

    return Padding(
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
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          filled: true,
          fillColor: Colors.grey.shade100,
          focusColor: secondaryColor,
          hintText: 'What are you looking for?',
        ),
      ),
    );
  }
}
