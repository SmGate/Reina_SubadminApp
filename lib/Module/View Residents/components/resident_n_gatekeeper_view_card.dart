// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';
import '../../../Widgets/my_dialog_box.dart';

class ResidentsNGateKeeperViewCard extends StatelessWidget {
  ResidentsNGateKeeperViewCard({
    required this.image,
    required this.name,
    required this.mobileno,
    this.DeleteDialogPress,
    this.updateOnPressed,
    this.showButton = true,
  });
  String? image;

  String? name;
  String? mobileno;
  bool showButton;

  void Function()? DeleteDialogPress;
  void Function()? updateOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
      width: 32.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
      height: 88.h,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: 12.h, left: 12.w, bottom: 12.w),
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
                width: 70.4000015258789.w,
                height: 64.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.400000095367432.r),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.cover),
                )),
            imageUrl: image.toString(),
            placeholder: (context, url) => Column(
              children: [
                CircularProgressIndicator(
                  color: AppColors.appThem,
                ),
              ],
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        10.pw,
        Padding(
          padding: EdgeInsets.only(top: 12.h, left: 97.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: reusableTextStyle(
                  textStyle: GoogleFonts.dmSans(),
                  fontSize: 18.0,
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.ph,
              Text(
                mobileno!,
                style: reusableTextStyle(
                  textStyle: GoogleFonts.dmSans(),
                  fontSize: 14.0,
                  color: AppColors.dark,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        if (showButton)
          Padding(
            padding: EdgeInsets.only(left: 240.w, top: 55.h),
            child: Row(
              children: [
                Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.appThem),
                  child: IconButton(
                    icon: SvgPicture.asset(AppImages.deleteNoticeBoard,
                        color: AppColors.globalWhite,
                        width: MediaQuery.of(context).size.width),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              image: SvgPicture.asset(
                                  AppImages.dialogueDeleteIcon,
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
                    icon: SvgPicture.asset(AppImages.editIcon,
                        color: AppColors.globalWhite,
                        width: MediaQuery.of(context).size.width),
                    onPressed: updateOnPressed,
                  ),
                ),
              ],
            ),
          ),
      ]),
    );
  }
}
