// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/Controller/street_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/empty_list.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Widgets/My_Floating_Button.dart';
import '../../component/house_N_street_card.dart';

class Street extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreetsController>(
        init: StreetsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                await Get.offNamed(streetorbuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                await Get.offNamed(blockbuildingorstreet,
                    arguments: [controller.user, controller.blockid]);
              } else if (controller.user.structureType == 3) {
                await Get.offNamed(blocks,
                    arguments: [controller.user, controller.phaseid]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    if (controller.user.structureType == 1) {
                      Get.offNamed(addstreets, arguments: controller.user);
                    } else if (controller.user.structureType == 2) {
                      Get.offNamed(addstreets, arguments: [
                        controller.user,
                        controller.blockid,
                      ]);
                    } else if (controller.user.structureType == 3) {
                      Get.offNamed(addstreets, arguments: [
                        controller.user,
                        controller.blockid,
                        controller.phaseid,
                      ]);
                    }
                    // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Streets',
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offNamed(streetorbuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offNamed(blockbuildingorstreet, arguments: [
                              controller.user,
                              controller.blockid
                            ]);
                          } else if (controller.user.structureType == 3) {
                            Get.offNamed(blocks, arguments: [
                              controller.user,
                              controller.phaseid
                            ]);
                          }
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 1)
                                  ? controller.streetsApi(
                                      dynamicid: controller.user.societyid!,
                                      bearerToken: controller.user.bearerToken!)
                                  : controller.streetsApi(
                                      dynamicid: controller.blockid,
                                      bearerToken:
                                          controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null &&
                                      snapshot.data.data.length != 0) {
                                    return ListView.builder(
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomCardHouseStreet(
                                          onTap: () {
                                            if (controller.user.structureType ==
                                                1) {
                                              Get.offAndToNamed(houses,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot.data.data[index].id
                                                  ]);
                                            } else if (controller
                                                    .user.structureType ==
                                                2) {
                                              Get.offAndToNamed(houses,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot
                                                        .data.data[index].id,
                                                    controller.blockid
                                                  ]);
                                            } else if (controller
                                                    .user.structureType ==
                                                3) {
                                              Get.offAndToNamed(houses,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot
                                                        .data.data[index].id,
                                                    controller.blockid,
                                                    controller.phaseid
                                                  ]);
                                            }
                                          },
                                          widget: Center(),
                                          firstHeight: 61.h,
                                          firstWidth: 299.w,
                                          firstcolor: Colors.white,
                                          sHeight: 25.h,
                                          sWidth: 25.w,
                                          scolor: HexColor('#EFEFEF'),
                                          text: snapshot
                                              .data.data[index].address
                                              .toString(),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(name: 'No Streets');
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return CircularIndicatorUnderWhiteBox();
                                }
                              })),
                    ],
                  )),
            ),
          );
        });
  }
}
