// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My_Floating_Button.dart';
import '../../component/Custom_Grid.dart';
import '../Controller/block_building_controller.dart';

class BlockBuilding extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockBuildingController>(
        init: BlockBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 2) {
                Get.offAndToNamed(blockbuildingorstreet,
                    arguments: [controller.user, controller.bid]);
              } else {
                Get.offAndToNamed(phasebuildingorblock,
                    arguments: [controller.user, controller.pid]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    if (controller.user.structureType == 2) {
                      Get.offAndToNamed(addblockbuildingscreen,
                          arguments: [controller.user, controller.bid]);
                    } else {
                      Get.offAndToNamed(addblockbuildingscreen,
                          arguments: [controller.user, controller.pid]);
                    }
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Buildings',
                        onTap: () {
                          if (controller.user.structureType == 2) {
                            Get.offAndToNamed(blockbuildingorstreet,
                                arguments: [controller.user, controller.bid]);
                          } else {
                            Get.offAndToNamed(phasebuildingorblock,
                                arguments: [controller.user, controller.pid]);
                          }
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 2)
                                  ? controller.SocietyBuildingApi(
                                      dynamicid: controller.bid,
                                      token: controller.user.bearerToken!)
                                  : controller.SocietyBuildingApi(
                                      dynamicid: controller.pid,
                                      token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return GridView.builder(
                                    padding: EdgeInsets.only(
                                        left: 28.w, right: 27.w),
                                    itemCount: snapshot.data.data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 35,
                                            mainAxisSpacing: 15),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomGrid(
                                        onTap: () async {
                                          print(
                                              'buidling id ${snapshot.data.data[index].id}');

                                          print(
                                              'phase id ${snapshot.data.data[index].dynamicid}');

                                          Get.offAndToNamed(
                                              blockorphasebuildingfloorsscreen,
                                              arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                                snapshot
                                                    .data.data[index].dynamicid,
                                              ]);
                                        },
                                        text: snapshot.data.data[index]
                                            .societybuildingname
                                            .toString(),
                                      );
                                    },
                                  );
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
