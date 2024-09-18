// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:societyadminapp/Module/HomeScreen/components/menu_items.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class HomeScreen extends GetView {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            resizeToAvoidBottomInset: true,
            key: _scaffoldKey,
            // drawer: Drawer(
            //   child: ListView(
            //     padding: EdgeInsets.zero,
            //     children: [
            //       DrawerHeader(
            //           child: Column(
            //         children: [
            //           10.ph,
            //           controller.user.image != null ||
            //                   controller.user.image != ""
            //               ? Container(
            //                   height: 50,
            //                   width: 50,
            //                   decoration: BoxDecoration(shape: BoxShape.circle),
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(300),
            //                     child: CachedNetworkImage(
            //                       imageUrl:
            //                           "${Api.imageBaseUrl}${controller.user.image}",
            //                       fit: BoxFit.cover,
            //                       placeholder: (context, url) =>
            //                           CircularProgressIndicator(
            //                         color: AppColors.appThem,
            //                       ), // Placeholder widget while loading
            //                       errorWidget: (context, url, error) => Icon(Icons
            //                           .error), // Error widget if the image fails to load
            //                     ),
            //                   ),
            //                 )
            //               : Expanded(
            //                   child: Container(
            //                     child: Center(
            //                         child: Image.asset(
            //                       AppImages.user,
            //                       color: AppColors.appThem,
            //                     )),
            //                   ),
            //                 ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Text(
            //             controller.user.firstName! +
            //                 " " +
            //                 controller.user.lastName!,
            //             style: reusableTextStyle(
            //               textStyle: GoogleFonts.dmSans(),
            //               fontSize: 18.0,
            //               color: AppColors.textBlack,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ],
            //       )),
            //       ListTile(
            //         leading: Icon(
            //           Icons.logout,
            //           color: AppColors.appThem,
            //         ),
            //         title: Text("Logout"),
            //         onTap: () {
            //           MySharedPreferences.deleteUserData();
            //           Get.offAllNamed(login);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            body: SingleChildScrollView(
              child: Column(children: [
                // drawer title n bell
                Padding(
                  padding: EdgeInsets.only(top: 28.h, left: 20, right: 20),
                  child: Row(
                    children: [
                      controller.user.image != null ||
                              controller.user.image != ""
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(300),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Api.imageBaseUrl}${controller.user.image}",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    color: AppColors.appThem,
                                  ), // Placeholder widget while loading
                                  errorWidget: (context, url, error) => Icon(Icons
                                      .error), // Error widget if the image fails to load
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                child: Center(
                                    child: Image.asset(
                                  AppImages.user,
                                  color: AppColors.appThem,
                                )),
                              ),
                            ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          controller.user.firstName! +
                              " " +
                              controller.user.lastName!,
                          style: reusableTextStyle(
                            textStyle: GoogleFonts.dmSans(),
                            fontSize: 18.0,
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Spacer(),
                      controller.count == 0
                          ? IconButton(
                              icon: SvgPicture.asset(
                                AppImages.notification,
                                color: AppColors.appThem,
                                height: 30,
                              ),
                              onPressed: () {
                                Get.offNamed(reportnotificationsscreen,
                                    arguments: controller.user);
                              })
                          : badges.Badge(
                              position: badges.BadgePosition.bottomEnd(
                                  end: 4, bottom: 22),
                              badgeContent: Text(
                                controller.count >= 100
                                    ? controller.countGreaterThanHundred
                                    : controller.count.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              child: IconButton(
                                  icon: SvgPicture.asset(
                                    AppImages.notification,
                                    color: AppColors.appThem,
                                    height: 30,
                                  ),
                                  onPressed: () {
                                    Get.offNamed(reportnotificationsscreen,
                                        arguments: controller.user);
                                  }),
                            ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    //  left: 30.w,
                    top: 32.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuItems(
                            image: AppImages.resident,
                            title: "Residents",
                            ontap: () async {
                              Get.offNamed(viewuser,
                                  arguments: controller.user);
                            },
                          ),
                          MenuItems(
                            image: AppImages.gateKeeper,
                            title: "Gate\nKeeper",
                            ontap: () async {
                              Get.offNamed(gatekeeperscreen,
                                  arguments: controller.user);
                            },
                          ),
                        ],
                      ),

                      ////////////////////////////////
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuItems(
                            image: AppImages.societyEvents,
                            title: "Society\nEvents",
                            ontap: () async {
                              Get.offNamed(eventsscreen,
                                  arguments: controller.user);
                            },
                          ),
                          MenuItems(
                            image: AppImages.noticeBoard,
                            title: "Notice\nBoard",
                            ontap: () async {
                              Get.offNamed(noticeboardscreen,
                                  arguments: controller.user);
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      ////////////////////////////////
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controller.inProgressReportCount == 0
                              ? MenuItems(
                                  image: AppImages.report,
                                  title: "Report",
                                  ontap: () async {
                                    Get.offNamed(viewreportscreen,
                                        arguments: controller.user);
                                  },
                                )
                              : badges.Badge(
                                  position: badges.BadgePosition.bottomEnd(
                                      end: 2, bottom: 60),
                                  badgeContent: Text(
                                    controller.inProgressReportCount >= 100
                                        ? controller.countGreaterThanHundred
                                        : controller.inProgressReportCount
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: MenuItems(
                                    image: AppImages.report,
                                    title: "Report",
                                    ontap: () async {
                                      Get.offNamed(viewreportscreen,
                                          arguments: controller.user);
                                    },
                                  )),
                          (controller.user.structureType == 4)
                              ? MenuItems(
                                  image: AppImages.societyDetails,
                                  title: "Society\nDetails",
                                  ontap: () async {
                                    Get.offNamed(localbuildingscreen,
                                        arguments: controller.user);
                                  },
                                )
                              : MenuItems(
                                  image: AppImages.societyDetails,
                                  title: "Society\nDetails",
                                  ontap: () async {
                                    if (controller.user.structureType == 1) {
                                      Get.offNamed(streetorbuildingscreen,
                                          arguments: controller.user);
                                    } else if (controller.user.structureType ==
                                        2) {
                                      Get.offNamed(blockorsocietybuilding,
                                          arguments: controller.user);
                                    } else if (controller.user.structureType ==
                                        3) {
                                      Get.offNamed(phaseorsocietybuilding,
                                          arguments: controller.user);
                                    } else if (controller.user.structureType ==
                                        5) {
                                      Get.offNamed(
                                          structureType5HouseOrBuildingMiddlewareScreen,
                                          arguments: controller.user);
                                    }
                                  },
                                ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controller.unVerifiedUserCount == 0
                              ? MenuItems(
                                  image: AppImages.residentVerification,
                                  title: "Resident\nVerification",
                                  ontap: () async {
                                    Get.offNamed(unverifiedresident,
                                        arguments: controller.user);
                                  },
                                )
                              : badges.Badge(
                                  position: badges.BadgePosition.bottomEnd(
                                      end: 4, bottom: 60),
                                  badgeContent: Text(
                                    controller.inProgressReportCount >= 100
                                        ? controller.countGreaterThanHundred
                                        : controller.inProgressReportCount
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: MenuItems(
                                    image: AppImages.residentVerification,
                                    title: "Resident\nVerification",
                                    ontap: () async {
                                      Get.offNamed(unverifiedresident,
                                          arguments: controller.user);
                                    },
                                  )),
                          MenuItems(
                            image: AppImages.measurement,
                            title: "Measure\nMent",
                            ontap: () async {
                              Get.offNamed(measurementview,
                                  arguments: controller.user);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controller.emergencyCount == 0
                              ? MenuItems(
                                  image: AppImages.panicButton,
                                  title: "Residential\nEmergency",
                                  ontap: () async {
                                    Get.offNamed(residentialEmergencyScreen,
                                        arguments: controller.user);
                                  },
                                )
                              : badges.Badge(
                                  position: badges.BadgePosition.bottomEnd(
                                      end: 2, bottom: 60),
                                  badgeContent: Text(
                                    controller.inProgressReportCount >= 100
                                        ? controller.countGreaterThanHundred
                                        : controller.inProgressReportCount
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: MenuItems(
                                    image: AppImages.panicButton,
                                    title: "Residential\nEmergency",
                                    ontap: () async {
                                      Get.offNamed(residentialEmergencyScreen,
                                          arguments: controller.user);
                                    },
                                  )),
                          MenuItems(
                            image: AppImages.financeManager,
                            title: "Finance\nManager",
                            ontap: () async {
                              Get.offNamed(viewFinanceManager,
                                  arguments: controller.user);
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuItems(
                            image: AppImages.visitorsLogs,
                            title: "Visitors\nLogs",
                            ontap: () async {
                              Get.offNamed(visitorsLogs,
                                  arguments: controller.user);
                            },
                          ),
                          MenuItems(
                            image: AppImages.vote,
                            title: "E-Voting",
                            ontap: () async {
                              Get.offNamed(voting, arguments: controller.user);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuItems(
                            image: AppImages.rules,
                            title: "Rules\nBook",
                            ontap: () async {
                              Get.offNamed(societyRule,
                                  arguments: controller.user);
                            },
                          ),
                          MenuItems(
                            image: AppImages.parkinng,
                            title: "Parking\nManagement",
                            ontap: () async {
                              Get.offNamed(assignedParking,
                                  arguments: controller.user);
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MenuItems(
                            image: AppImages.logout,
                            title: "Logout",
                            ontap: () async {
                              MySharedPreferences.deleteUserData();
                              Get.offAllNamed(login);
                            },
                          ),
                          SizedBox(
                            width: 150,
                          )
                        ],
                      ),

                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
