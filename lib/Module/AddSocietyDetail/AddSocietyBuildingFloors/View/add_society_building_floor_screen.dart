// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Routes/set_routes.dart';
import '../../component/Cutom_Add_Building_Floor_Screen.dart';
import '../Controller/add_society_building_floor_controller.dart';

class AddSocietyBuildingFloors extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingFloorsController>(
        init: AddSocietyBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(societybuildingfloorsscreen,
                    arguments: [controller.user, controller.buildingid]);

                return false;
              },
              child: AddBuildingFloorCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(societybuildingfloorsscreen,
                      arguments: [controller.user, controller.buildingid]);
                },
                fromController: controller.fromController,
                toController: controller.toController,
                buttonLoading: controller.isLoading,
                buttonOnPressed: () {
                  if (!controller.isLoading) {
                    controller.addSocietybuildingFloorsApi(
                        bearerToken: controller.user.bearerToken!,
                        from: controller.fromController.text.toString(),
                        to: controller.toController.text.toString(),
                        buildingid: controller.buildingid!);
                  }
                },
              ));
        });
  }
}
