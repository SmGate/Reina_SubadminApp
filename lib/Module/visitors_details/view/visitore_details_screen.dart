import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/visitors_details/controller/visitor_details_controller.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

import '../../../Routes/set_routes.dart';
import '../../View Residents/components/Detail_shown_dialog_box.dart';

class VisitoreDetailsScreen extends StatelessWidget {
  const VisitoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var visitoreDetailsScreenController =
        Get.find<VisitoreDetailsScreenController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            MyBackButton(
              text: 'Visitors Details',
              onTap: () {
                Get.offNamed(homescreen,
                    arguments: visitoreDetailsScreenController.userdata);
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: visitoreDetailsScreenController.getVisitorsDetails(
                    visitoreDetailsScreenController.user.userid!,
                    visitoreDetailsScreenController.user.bearerToken ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child:
                          CircularIndicatorUnderWhiteBox(), // Or any other loading indicator
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          'Error: ${snapshot.error}'), // Display an error message
                    );
                  } else {
                    return ListView.builder(
                        itemCount: visitoreDetailsScreenController.li.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
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
                                                  visitoreDetailsScreenController
                                                          .li[index].name ??
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
                                                    text:
                                                        visitoreDetailsScreenController
                                                            .li[index].mobileno
                                                            .toString()),
                                                DetailShownDialogBox(
                                                  heading: "CNIC",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index].cnic ??
                                                          "",
                                                  icon: AppImages.cnic,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Address",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index]
                                                              .houseaddress ??
                                                          "",
                                                  icon: AppImages.address,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Visitor TYPE",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index]
                                                              .visitortype ??
                                                          "",
                                                  icon:
                                                      AppImages.visitorDetails,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Vehicle No",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index]
                                                              .vechileno ??
                                                          "",
                                                  icon: AppImages.vahicleNo,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Arrival Date",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index]
                                                              .arrivaldate ??
                                                          "",
                                                  icon: AppImages.date2,
                                                  isPng: true,
                                                ),
                                                DetailShownDialogBox(
                                                  heading: "Arrival Time",
                                                  text:
                                                      visitoreDetailsScreenController
                                                              .li[index]
                                                              .arrivaltime ??
                                                          "",
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
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: index == 0 ? 20 : 10,
                                  left: 10,
                                  right: 10),
                              width: double.infinity,
                              child: Card(
                                elevation: 6,
                                color: AppColors.globalWhite,
                                surfaceTintColor: AppColors.globalWhite,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        AppImages.user,
                                        height: 50,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21.w, top: 12.h),
                                          child: Text(
                                            visitoreDetailsScreenController
                                                    .li[index].name ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: reusableTextStyle(
                                              textStyle: GoogleFonts.dmSans(),
                                              fontSize: 16.0,
                                              color: AppColors.textBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 21.w),
                                          child: Text(
                                            visitoreDetailsScreenController
                                                    .li[index].houseaddress ??
                                                "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: reusableTextStyle(
                                              textStyle: GoogleFonts.dmSans(),
                                              fontSize: 14.0,
                                              color: AppColors.dark,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21.w, bottom: 10),
                                          child: Text(
                                            visitoreDetailsScreenController
                                                    .li[index].cnic ??
                                                "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: reusableTextStyle(
                                              textStyle: GoogleFonts.dmSans(),
                                              fontSize: 14.0,
                                              color: AppColors.dark,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
