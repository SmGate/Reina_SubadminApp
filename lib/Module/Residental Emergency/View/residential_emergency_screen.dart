// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/Residental%20Emergency/component/emergency_card.dart';
import 'package:societyadminapp/Module/Residental%20Emergency/component/emergency_dialogue.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/empty_list.dart';
import '../Controller/residential_emergency_controller.dart';

class ResidentialEmergencyScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentialEmergencyController>(
        init: ResidentialEmergencyController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Emergency',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      22.h.ph,
                      Expanded(
                        child: FutureBuilder(
                            future: controller.viewVistorsDetailApi(
                                controller.userdata.userid!,
                                controller.userdata.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.data != null &&
                                    snapshot.data.data!.length != 0) {
                                  return ListView.builder(
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                      backgroundColor:
                                                          AppColors.globalWhite,
                                                      surfaceTintColor:
                                                          AppColors.globalWhite,
                                                      content: EmergencyDialog(
                                                          problem: snapshot
                                                              .data!
                                                              .data![index]
                                                              .problem,
                                                          createdAt: snapshot
                                                              .data!
                                                              .data![index]
                                                              .createdAt,
                                                          address: snapshot
                                                              .data!
                                                              .data![index]
                                                              .resident
                                                              .first
                                                              .address,
                                                          mobileNo: snapshot
                                                              .data!
                                                              .data![index]
                                                              .resident
                                                              .first
                                                              .mobileno,
                                                          description: snapshot
                                                              .data!
                                                              .data![index]
                                                              .description),
                                                    ));
                                          },
                                          child: EmergencyCard(snapshot, index),
                                        );
                                      },
                                      itemCount: snapshot.data.data.length);
                                } else {
                                  return EmptyList(
                                    name: "No Emergency Reported.",
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return CircularIndicatorUnderWhiteBox();
                              } else {
                                return CircularIndicatorUnderWhiteBox();
                              }
                            }),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
