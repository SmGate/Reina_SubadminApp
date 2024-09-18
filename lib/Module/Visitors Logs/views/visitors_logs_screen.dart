// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/View%20Residents/components/Detail_shown_dialog_box.dart';
import 'package:societyadminapp/Module/Visitors%20Logs/controller/visitors_logs_controller.dart';
import 'package:societyadminapp/Module/Visitors%20Logs/model/visitors_logs_model.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/custom_card.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../Widgets/loading.dart';
import '../../../Widgets/my_button.dart';
import '../../../utils/Constants/app_images.dart';
import '../../../utils/helpers/date_helpers.dart';
import '../../../utils/style/text_style.dart';

class VisitorsLogsScreen extends StatelessWidget {
  const VisitorsLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var visitorsLogsController = Get.find<VisitorsLogsController>();
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(homescreen, arguments: visitorsLogsController.user);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              MyBackButton(
                text: "Visitors Logs",
                onTap: () {
                  Get.offNamed(homescreen,
                      arguments: visitorsLogsController.user);
                },
              ),
              Expanded(
                  child: FutureBuilder<VisitorsLogsModel>(
                future: visitorsLogsController.getVisitorsLogs(
                    societyId:
                        visitorsLogsController.userdata.societyid.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularIndicatorUnderWhiteBox());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: visitorsLogsController
                            .visitorsLogsModel.data?.length,
                        itemBuilder: (context, index) {
                          int lastItem = (visitorsLogsController
                                  .visitorsLogsModel.data?.length)! -
                              1;
                          return CustomCard(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      backgroundColor: AppColors.globalWhite,
                                      surfaceTintColor: AppColors.globalWhite,
                                      child: SizedBox(
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .name ??
                                                      "",
                                                  style: reusableTextStyle(
                                                    textStyle:
                                                        GoogleFonts.dmSans(),
                                                    fontSize: 18.0,
                                                    color: AppColors.textBlack,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                20.ph,
                                                DetailShownDialogBox(
                                                    icon: AppImages.contact,
                                                    heading: 'Mobile No',
                                                    isPng: true,
                                                    text: visitorsLogsController
                                                            .visitorsLogsModel
                                                            .data?[index]
                                                            .mobileno ??
                                                        ""),
                                                DetailShownDialogBox(
                                                  heading: "CNIC",
                                                  text: visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .cnic ??
                                                      "",
                                                  icon: AppImages.cnic,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Visitor TYPE",
                                                  text: visitorsLogsController
                                                      .visitorsLogsModel
                                                      .data?[index]
                                                      .visitortype,
                                                  icon:
                                                      AppImages.visitorDetails,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Vehicle No",
                                                  text: visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .vechileno ??
                                                      "NA",
                                                  icon: AppImages.vahicleNo,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Arrival Date",
                                                  text: DateHelpers().formatDate(
                                                      visitorsLogsController
                                                              .visitorsLogsModel
                                                              .data?[index]
                                                              .arrivaldate
                                                              .toString() ??
                                                          "NA"),
                                                  icon: AppImages.date2,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Check In Time",
                                                  text: visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .checkintime ??
                                                      "NA",
                                                  icon: AppImages.timeIcon,
                                                  isPng: false,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Check Out Time",
                                                  text: visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .checkouttime ??
                                                      "NA",
                                                  icon: AppImages.timeIcon,
                                                  isPng: false,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                MyButton(
                                                  name: "Okay",
                                                  gradient: AppGradients
                                                      .buttonGradient,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            boxShadow: BoxShadow(),
                            margin: EdgeInsets.only(
                                top: index == 0 ? 20 : 20,
                                left: 20,
                                right: 20,
                                bottom: index == lastItem ? 20 : 0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  visitorsLogsController.visitorsLogsModel
                                                  .data?[index].image ==
                                              "" ||
                                          visitorsLogsController
                                                  .visitorsLogsModel
                                                  .data?[index]
                                                  .image ==
                                              null
                                      ? Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            AppImages.user,
                                            height: 50,
                                          ),
                                        )
                                      : Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "${Api.imageBaseUrl}${visitorsLogsController.visitorsLogsModel.data?[index].image}",
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(
                                                color: AppColors.appThem,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 21.w,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              visitorsLogsController
                                                      .visitorsLogsModel
                                                      .data?[index]
                                                      .name ??
                                                  "",
                                              textAlign: TextAlign.center,
                                              style: reusableTextStyle(
                                                textStyle: GoogleFonts.dmSans(),
                                                fontSize: 16.0,
                                                color: AppColors.textBlack,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Visitor Type"),
                                                  Text("Vehicle No"),
                                                  // Text("Status"),
                                                ]),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .visitortype ??
                                                      "",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: reusableTextStyle(
                                                    textStyle:
                                                        GoogleFonts.dmSans(),
                                                    fontSize: 14.0,
                                                    color: AppColors.dark,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  visitorsLogsController
                                                          .visitorsLogsModel
                                                          .data?[index]
                                                          .vechileno ??
                                                      "",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: reusableTextStyle(
                                                    textStyle:
                                                        GoogleFonts.dmSans(),
                                                    fontSize: 14.0,
                                                    color: AppColors.dark,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else {
                    return Center(child: Text("No Data"));
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
