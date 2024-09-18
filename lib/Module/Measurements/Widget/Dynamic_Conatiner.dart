// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

TextStyle myStyle = GoogleFonts.quicksand(
  color: Color(0xFF6A7380),
  fontWeight: FontWeight.w500,
  fontSize: 14.font,
);
TextStyle myStyle2 = GoogleFonts.quicksand(
  color: Color(0xFF0D0B0C),
  fontSize: 14.font,
  fontWeight: FontWeight.w600,
);

class DynamicContainer extends StatelessWidget {
  DynamicContainer({
    required this.heading,
    required this.unitType,
    required this.serviceCharges,
    required this.tax,
    required this.appCharges,
    required this.area,
  });
  String? heading;
  String? unitType;
  String? serviceCharges;
  String? tax;
  String? appCharges;
  String? area;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        Container(
          width: 329.w,
          height: 230.h,
          margin: EdgeInsets.only(left: 23.w, right: 23.w),
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          decoration: ShapeDecoration(
            color: AppColors.globalWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading!,
                style: reusableTextStyle(
                  textStyle: GoogleFonts.dmSans(),
                  fontSize: 18.0,
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unit Type',
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        'Service Charges',
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        'Tax',
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        'App Charges',
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        'Area',
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  70.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unitType!.toString(),
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        serviceCharges!.toString(),
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        tax!.toString(),
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        appCharges!.toString(),
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      16.ph,
                      Text(
                        area!.toString(),
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 14.0,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
