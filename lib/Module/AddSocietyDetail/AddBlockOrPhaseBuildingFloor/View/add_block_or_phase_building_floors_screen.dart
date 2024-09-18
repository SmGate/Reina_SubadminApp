// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/set_routes.dart';
import '../../component/Cutom_Add_Building_Floor_Screen.dart';
import '../Controller/add_block_or_phase_building_floors_controller.dart';

class AddBlockOrPhaseBuildingFloors extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AAddBlockOrPhaseBuildingFloorsController>(
        init: AAddBlockOrPhaseBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(blockorphasebuildingfloorsscreen, arguments: [
                  controller.user,
                  controller.buildingid,
                  controller.dynamicid
                ]);

                return false;
              },
              child: AddBuildingFloorCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(blockorphasebuildingfloorsscreen,
                      arguments: [
                        controller.user,
                        controller.buildingid,
                        controller.dynamicid
                      ]);
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
