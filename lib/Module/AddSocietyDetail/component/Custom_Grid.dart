import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

// ignore: must_be_immutable
class CustomGrid extends StatelessWidget {
  CustomGrid({required this.onTap, required this.text, this.image});
  void Function()? onTap;
  String? text;
  Widget? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.globalWhite,
        surfaceTintColor: AppColors.globalWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60.22.h,
              width: 60.22.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.appThem),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(
                  AppImages.resident,
                  color: Colors.white,
                ),
              )),
            ),
            8.ph,
            Text(
              text!,
              textAlign: TextAlign.center,
              style: reusableTextStyle(
                textStyle: GoogleFonts.dmSans(),
                fontSize: 16.0,
                color: AppColors.boldHeading,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
