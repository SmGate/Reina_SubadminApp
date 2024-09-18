// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';

import '../../component/Custom_List.dart';
import '../Controller/society_building_floor_controller.dart';

class SocietyBuildingFloorsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingFloorsController>(
        init: SocietyBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 3) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 5) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: Container(
                    decoration: BoxDecoration(
                        gradient: AppGradients.floatingbuttonGradient,
                        shape: BoxShape.circle),
                    child: IconButton(
                        iconSize: 50,
                        icon: Icon(
                          Icons.add,
                          color: AppColors.globalWhite,
                        ),
                        onPressed: () {
                          Get.offAndToNamed(addsocietybuildingfloors,
                              arguments: [
                                controller.user,
                                controller.buildingid!
                              ]);
                        }),
                  ),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Floors',
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 3) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 5) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          }
                        },
                      ),
                      20.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.futureFloors,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomList(
                                          onTap: () {
                                            Get.offAndToNamed(
                                                societybuildingapartmentscreen,
                                                arguments: [
                                                  controller.user,
                                                  snapshot.data.data[index].id,
                                                  controller.buildingid
                                                ]);
                                          },
                                          text: snapshot.data.data[index].name
                                              .toString());
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
