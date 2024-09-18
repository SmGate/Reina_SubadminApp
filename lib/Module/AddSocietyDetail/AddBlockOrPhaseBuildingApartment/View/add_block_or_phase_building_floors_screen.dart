// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/set_routes.dart';
import '../../component/Cutom_Add_Building_Apartment_Screen.dart';
import '../Controller/add_block_or_phase_building_floors_controller.dart';

class AddBlockOrPhaseBuildingApartmentsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBlockOrPhaseBuildingApartmentsController>(
        init: AddBlockOrPhaseBuildingApartmentsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(blockOrphasebuildingapartmentsscreen,
                    arguments: [
                      controller.user,
                      controller.fid,
                      controller.bid,
                      controller.dynamicid
                    ]);

                return false;
              },
              child: AddBuildingApartmentCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(blockOrphasebuildingapartmentsscreen,
                      arguments: [
                        controller.user,
                        controller.fid,
                        controller.bid,
                        controller.dynamicid
                      ]);
                },
                fromController: controller.fromController,
                toController: controller.toController,
                buttonLoading: controller.isLoading,
                buttonOnPressed: () {
                  if (!controller.isLoading) {
                    controller.addApartmentsApi(
                      bearerToken: controller.user.bearerToken!,
                      from: controller.fromController.text.toString(),
                      to: controller.toController.text.toString(),
                      fid: controller.fid!,
                    );
                  }
                },
              ));
        });
  }
}
