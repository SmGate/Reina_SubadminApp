import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

// ignore: must_be_immutable
class CustomCardHouseStreet extends StatelessWidget {
  CustomCardHouseStreet({
    required this.onTap,
    required this.widget,
    required this.text,
    required this.firstHeight,
    required this.firstWidth,
    required this.firstcolor,
    required this.sHeight,
    required this.sWidth,
    required this.scolor,
  });
  void Function()? onTap;
  Widget widget;
  String text;
  double? firstHeight;
  double? firstWidth;
  Color? firstcolor;
  double? sHeight;
  double? sWidth;
  Color? scolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: firstWidth,
              height: firstHeight,
              margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 1.0.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.5, 0.5), //(x,y)
                      blurRadius: .5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.globalWhite),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: sHeight,
                        width: sWidth,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.appThem),
                        child: widget),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Text(
                        text,
                        style: reusableTextStyle(
                            textStyle: GoogleFonts.dmSans(),
                            fontSize: 14.0,
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
              )),
          15.ph,
        ],
      ),
    );
  }
}
