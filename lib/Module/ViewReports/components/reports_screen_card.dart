// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

import '../../../Widgets/my_button.dart';

class ReportsScreenCard extends StatelessWidget {
  ReportsScreenCard(
      {this.img,
      this.heading,
      this.heading1,
      this.heading2,
      this.onPressed,
      this.showImg = true,
      this.showIcon = true,
      this.buttonName,
      this.color});

  String? img;
  bool showImg;
  bool showIcon;

  String? heading;
  String? heading1;
  String? heading2;
  void Function()? onPressed;
  String? buttonName;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10.h),
      child: Container(
        width: double.infinity,
        // height: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: Color.fromRGBO(187, 187, 187, 0.3),
            width: 0.3.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(50, 50, 71, 0.08),

              blurRadius: 32,
              offset: Offset(0, 24), // changes position of shadow
            ),
          ],
          color: HexColor('#FFFFFF'),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: (showIcon) ? 19.w : 12.w, top: 12.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showImg && img != null)
                    CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                          width: 70.4000015258789.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(6.400000095367432.r),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(img.toString()),
                                fit: BoxFit.cover),
                          )),
                      imageUrl: img.toString(),
                      placeholder: (context, url) => Column(
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.appThem,
                          ),
                        ],
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  14.6.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading!,
                        maxLines: 1,
                        style: reusableTextStyle(
                          textStyle: GoogleFonts.dmSans(),
                          fontSize: 18.0,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      6.ph,
                      SizedBox(
                        width: 230,
                        child: Text(
                          heading1!,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: reusableTextStyle(
                            textStyle: GoogleFonts.dmSans(),
                            fontSize: 14.0,
                            color: AppColors.dark,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      3.ph,
                      if (showIcon) 9.86.ph,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showIcon) ...[
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.textBlack,
                              size: 16.72.w,
                            ),
                            11.32.pw,
                          ],
                          Text(
                            heading2!,
                            style: reusableTextStyle(
                              textStyle: GoogleFonts.dmSans(),
                              fontSize: 14.0,
                              color: AppColors.dark,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10, right: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: MyButton(
                      gradient: AppGradients.buttonGradient,
                      name: buttonName!,
                      color: color,
                      fontSize: 8.font,
                      height: 30.h,
                      width: 100.w,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.05,
                      onPressed: onPressed),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
