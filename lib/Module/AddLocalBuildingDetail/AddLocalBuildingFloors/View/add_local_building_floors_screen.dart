// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/set_routes.dart';
import '../../../AddSocietyDetail/component/Cutom_Add_Building_Floor_Screen.dart';
import '../Controller/add_local_building_floors_controller.dart';

class AddLocalBuildingFloors extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddLocalBuildingFloorsController>(
        init: AddLocalBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(localbuildingfloorsscreen,
                    arguments: controller.user);

                return true;
              },
              child: AddBuildingFloorCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(localbuildingfloorsscreen,
                      arguments: controller.user);
                },
                fromController: controller.fromController,
                toController: controller.toController,
                buttonLoading: controller.isLoading,
                buttonOnPressed: () {
                  // print(controller.user.userid);
                  // print(controller.user.bearerToken);
                  if (!controller.isLoading) {
                    controller.addLocalbuildingFloorsApi(
                      bearerToken: controller.user.bearerToken!,
                      from: controller.fromController.text.toString(),
                      to: controller.toController.text.toString(),
                      buildingid: controller.user.societyid!,
                      subadminid: controller.user.userid!,
                    );
                  }
                },
              ));
        });
  }
}
