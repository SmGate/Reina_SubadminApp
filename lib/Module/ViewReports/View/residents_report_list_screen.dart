// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../components/dialog_box_elipse_heading.dart';
import '../../../Widgets/my_button.dart';
import '../components/reports_screen_card.dart';
import '../Controller/resident_reports_controller.dart';
import '../Model/ResidentReports.dart';

class UserReportsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentReportsController>(
      init: ResidentReportsController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(viewreportscreen, arguments: controller.userdata);

          return true;
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.background,
              body: Column(
                children: [
                  MyBackButton(
                    text: 'Reports',
                    onTap: () {
                      Get.offNamed(viewreportscreen,
                          arguments: controller.userdata);
                    },
                  ),
                  Expanded(
                    child: FutureBuilder<List<ResidentReports>>(
                        future: controller.viewResidentsReportsApi(
                            controller.userdata.userid!,
                            controller.residentId,
                            controller.userdata.bearerToken!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null &&
                                snapshot.data!.length != 0) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ReportsScreenCard(
                                    heading:
                                        snapshot.data![index].title.toString(),
                                    heading1: snapshot.data![index].description
                                        .toString(),
                                    heading2: convertUtcToFormattedTimeAdd5Hours(
                                            snapshot.data![index].updatedAt!) +
                                        " " +
                                        convertLaravelDateFormatToDayMonthYearDateFormat(
                                            snapshot.data![index].updatedAt!),
                                    buttonName: 'In Progress',
                                    color: HexColor('#D20C0C'),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            backgroundColor:
                                                AppColors.globalWhite,
                                            surfaceTintColor:
                                                AppColors.globalWhite,
                                            content: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      'Report Detail',
                                                      style: reusableTextStyle(
                                                        textStyle: GoogleFonts
                                                            .dmSans(),
                                                        fontSize: 18.0,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  14.h.ph,
                                                  DialogBoxElipseHeading(
                                                    text: "Title",
                                                  ),
                                                  8.95.h.ph,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.w),
                                                    child: Text(
                                                      snapshot.data![index]
                                                              .title ??
                                                          "",
                                                      style: reusableTextStyle(
                                                        textStyle: GoogleFonts
                                                            .dmSans(),
                                                        fontSize: 12.0,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  8.95.h.ph,
                                                  DialogBoxElipseHeading(
                                                    text: "Description",
                                                  ),
                                                  8.95.h.ph,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.w),
                                                    child: Text(
                                                      snapshot.data![index]
                                                              .description ??
                                                          "",
                                                      style: reusableTextStyle(
                                                        textStyle: GoogleFonts
                                                            .dmSans(),
                                                        fontSize: 12.0,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  8.95.h.ph,
                                                  DialogBoxElipseHeading(
                                                    text: "Mobile No",
                                                  ),
                                                  8.95.h.ph,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .residentMobileno ??
                                                              "",
                                                          style:
                                                              reusableTextStyle(
                                                            textStyle:
                                                                GoogleFonts
                                                                    .dmSans(),
                                                            fontSize: 12.0,
                                                            color: AppColors
                                                                .textBlack,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              controller.uri =
                                                                  Uri.parse(
                                                                      "tel://${controller.residentMobileno}");

                                                              try {
                                                                await launchUrl(
                                                                    controller
                                                                        .uri!);
                                                                controller.uri =
                                                                    null;
                                                              } catch (e) {}
                                                            },
                                                            icon: Icon(
                                                              Icons.call,
                                                              color:
                                                                  Colors.green,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  8.95.h.ph,
                                                  DialogBoxElipseHeading(
                                                    text: "Name",
                                                  ),
                                                  8.95.h.ph,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.w),
                                                    child: Text(
                                                      controller.residentName ??
                                                          "",
                                                      style: reusableTextStyle(
                                                        textStyle: GoogleFonts
                                                            .dmSans(),
                                                        fontSize: 12.0,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  8.95.h.ph,
                                                  DialogBoxElipseHeading(
                                                    text: "Address",
                                                  ),
                                                  8.95.h.ph,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.w),
                                                    child: Text(
                                                      controller
                                                              .residentAddress ??
                                                          "",
                                                      style: reusableTextStyle(
                                                        textStyle: GoogleFonts
                                                            .dmSans(),
                                                        fontSize: 12.0,
                                                        color:
                                                            AppColors.textBlack,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  14.h.ph,
                                                  Center(
                                                    child: MyButton(
                                                      gradient: AppGradients
                                                          .buttonGradient,
                                                      border: 4.r,
                                                      width: double.infinity,
                                                      height: 45.w,
                                                      name: 'Ok',
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  ),
                                                  14.h.ph,
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                  );
                                },
                                itemCount: snapshot.data!.length,
                              );
                            } else {
                              return Center(child: Text('no resident'));
                            }
                          } else if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return Center(
                                child: CircularIndicatorUnderWhiteBox());
                          }
                        }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
