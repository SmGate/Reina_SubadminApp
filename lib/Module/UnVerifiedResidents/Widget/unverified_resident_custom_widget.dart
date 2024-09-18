import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

// ignore: must_be_immutable
class UnverifiedCard extends StatelessWidget {
  UnverifiedCard(
      {required this.onTap, required this.name, required this.mobileno});

  void Function()? onTap;

  String name;
  String mobileno;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.h.ph,
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(16.w, 1.w, 16.w, 0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.25, color: AppColors.appThem),
              borderRadius: BorderRadius.circular(8.r),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3D000000),
                blurRadius: 1,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        name,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          color: AppColors.textBlack,
                          fontSize: 16.font,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      mobileno,
                      style: GoogleFonts.poppins(
                        color: Color(0xFFB8B8B8),
                        fontSize: 12.font,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: MyButton(
                    gradient: AppGradients.buttonGradient,
                    name: 'Unverified',
                    width: 100,
                    height: 30.h,
                    fontSize: 10.font,
                    fontWeight: FontWeight.w500,
                    border: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
        20.ph,
      ],
    );
  }
}
