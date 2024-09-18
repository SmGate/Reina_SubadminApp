// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuContainer extends StatelessWidget {
  String img;
  String name;
  String? secText;
  void Function() onTap;
  MenuContainer(
      {super.key,
      required this.img,
      required this.name,
      required this.onTap,
      this.secText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: GoogleFonts.ubuntu(
                    fontSize: ScreenUtil().setSp(14),
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              secText == ""
                  ? SizedBox()
                  : Text(
                      secText ?? "",
                      style: GoogleFonts.ubuntu(
                          fontSize: ScreenUtil().setSp(14),
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
