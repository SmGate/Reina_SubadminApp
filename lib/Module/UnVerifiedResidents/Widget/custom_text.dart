// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';

class CustomUnverifiedText extends StatelessWidget {
  CustomUnverifiedText({required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: 14.font,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
