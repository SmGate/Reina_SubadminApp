// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Widgets/my_dialog_box.dart';

class EventnNoticeBoardViewCard extends StatelessWidget {
  EventnNoticeBoardViewCard(
      {this.eventCardDesginImg,
      this.showeventCardDesginImg = true,
      required this.title,
      required this.description,
      this.showButtons = true, // Add a flag for showing buttons
      this.onPressedofAddImage,
      this.onPressedofViewImage,
      required this.DeleteDialogPress,
      required this.updateOnPressed,
      required this.startdate,
      required this.enddate,
      this.gradientColors = const [],
      this.iconColor,
      this.startDatecolor,
      this.endDatecolor});
  String? eventCardDesginImg;

  String? title;
  String? description;
  bool showButtons;
  bool showeventCardDesginImg;
  List<Color> gradientColors;

  void Function()? onPressedofAddImage;
  void Function()? onPressedofViewImage;
  void Function()? DeleteDialogPress;
  void Function()? updateOnPressed;
  String? startdate;
  String? enddate;
  Color? iconColor;
  Color? startDatecolor;
  Color? endDatecolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // width: 327.w,
      margin: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 12.h,
      ),
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
      child: Stack(
        children: [
          if (showeventCardDesginImg)
            Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  eventCardDesginImg!,
                  color: AppColors.appThem,
                )),
          //TITLE
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 12.h),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: reusableTextStyle(
                  textStyle: GoogleFonts.dmSans(),
                  fontSize: 16.0,
                  color: AppColors.boldHeading,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //DESCRIPTION
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 39.w),
            child: Text(
              description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: reusableTextStyle(
                  textStyle: GoogleFonts.dmSans(),
                  fontSize: 12.0,
                  color: AppColors.dark,
                  fontWeight: FontWeight.normal),
            ),
          ),

          //Add And View Image Buttons
          // Conditionally show buttons
          Padding(
            padding:
                EdgeInsets.only(left: (showButtons) ? 18.w : 250, top: 65.h),
            child: Row(
              children: [
                if (showButtons) ...[
                  MyButton(
                      width: 80.w,
                      textColor: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(10),
                      height: 22.h,
                      name: 'AddImage',
                      color: HexColor('#E8E8E8'),
                      elevation: 0,
                      onPressed: onPressedofAddImage),
                  8.pw,
                ],
                if (showButtons) ...[
                  MyButton(
                    elevation: 0,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w400,
                    width: 85.w,
                    height: 22.h,
                    fontSize: ScreenUtil().setSp(10),
                    name: 'View Image',
                    color: primaryColor,
                    onPressed: onPressedofViewImage,
                  ),
                  42.pw,
                ],
                Spacer(),
                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.appThem),
                  child: IconButton(
                    icon: Image.asset(
                      AppImages.delete,
                      height: 13.h,
                      width: 12.w,
                      color: AppColors.globalWhite,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              image: Image.asset(AppImages.delete,
                                  color: AppColors.globalWhite,
                                  width:
                                      MediaQuery.of(context).size.width * 0.06),
                              negativeBtnPressed: () {
                                Get.back();
                              },
                              title: "Are you sure !",
                              content: "Do you want to delete this?",
                              positiveBtnText: "Delete",
                              negativeBtnText: "Cancel",
                              positiveBtnPressed: DeleteDialogPress,
                            );
                          });
                    },
                  ),
                ),
                6.pw,
                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.appThem),
                  child: IconButton(
                    icon: Image.asset(AppImages.update,
                        color: AppColors.globalWhite,
                        height: 13.h,
                        width: 12.w),
                    onPressed: updateOnPressed,
                  ),
                ),
                20.pw,
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 21.w,
              right: 20.w,
              top: 95.h,
              bottom: 8.h,
            ),
            child: Container(
              width: 286.w,
              height: 34.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: AppColors.appThem),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 14.w,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: ScreenUtil().setWidth(20),
                      color: iconColor ?? HexColor('#FFFFFF'),
                    ),
                    14.pw,
                    Text(startdate!,
                        style: GoogleFonts.ubuntu(
                          color: startDatecolor ?? HexColor('#FFFFFF'),
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0015,
                          fontSize: ScreenUtil().setSp(14),
                        )),
                    26.pw,
                    SvgPicture.asset(
                      AppImages.arrowForward,
                    ),
                    27.pw,
                    Text(enddate!,
                        style: GoogleFonts.ubuntu(
                          color: endDatecolor ?? HexColor('#FFFFFF'),
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0015,
                          fontSize: ScreenUtil().setSp(14),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
