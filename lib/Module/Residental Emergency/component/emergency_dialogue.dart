import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/Residental%20Emergency/Controller/residential_emergency_controller.dart';
import 'package:societyadminapp/Module/ViewReports/components/dialog_box_elipse_heading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/Constants/constants.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyDialog extends StatelessWidget {
  final String? problem;
  final String? description;
  final String? address;
  final String? createdAt;
  final String? mobileNo;

  const EmergencyDialog({
    super.key,
    required this.problem,
    required this.description,
    required this.address,
    required this.createdAt,
    required this.mobileNo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              problem ?? "",
              style: reusableTextStyle(
                textStyle: GoogleFonts.dmSans(),
                fontSize: 18.0,
                color: AppColors.textBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          14.h.ph,
          DialogBoxElipseHeading(
            text: "Emergency At",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(convertDateFormatToDayMonthYearDateFormat(createdAt!),
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: HexColor('#606470'))),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Address",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(address ?? "",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: HexColor('#606470'))),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Mobile No",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Row(
              children: [
                Text(mobileNo ?? "",
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: HexColor('#606470'))),
                SizedBox(
                  width: 4,
                ),
                IconButton(
                    onPressed: () async {
                      final ResidentialEmergencyController controller =
                          Get.find();
                      controller.uri = Uri.parse("tel://${mobileNo}");

                      try {
                        await launchUrl(controller.uri!);
                        controller.uri = null;
                      } catch (e) {}
                    },
                    icon: Icon(
                      Icons.call,
                      color: Colors.green,
                    ))
              ],
            ),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Description",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(description ?? "",
                style: GoogleFonts.ubuntu(
                    fontSize: 11.sp, color: HexColor('#333333'))),
          ),
          14.h.ph,
          Center(
            child: MyButton(
              gradient: AppGradients.buttonGradient,
              border: 4.r,
              width: double.infinity,
              height: 40,
              name: 'Ok',
              onPressed: () {
                Get.back();
              },
            ),
          ),
          14.h.ph,
        ],
      ),
    );
  }
}
