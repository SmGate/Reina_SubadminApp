import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class CustomList extends StatelessWidget {
  CustomList({required this.onTap, required this.text});
  void Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        // Wrap the container with an InkWell to enable splash effect
        child: Material(
          color: Colors.transparent, // Make the container transparent
          child: InkWell(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), onTap);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        text!,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            // color: secondaryColor,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#4D4D4D')),
                      ),
                      Spacer(),
                      Container(
                        width: 28.w,
                        height: 15.h,
                        child: SvgPicture.asset(
                          'assets/arrowfrwdsvg.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
