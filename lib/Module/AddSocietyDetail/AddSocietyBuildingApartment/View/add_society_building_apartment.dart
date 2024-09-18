// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Routes/set_routes.dart';
import '../../component/Cutom_Add_Building_Apartment_Screen.dart';
import '../Controller/add_society_building_controller.dart';

class AddSocietyBuildingApartmentsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingApartmentsController>(
        init: AddSocietyBuildingApartmentsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(societybuildingapartmentscreen, arguments: [
                  controller.user,
                  controller.fid,
                  controller.bid
                ]);

                return false;
              },
              child: AddBuildingApartmentCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(societybuildingapartmentscreen, arguments: [
                    controller.user,
                    controller.fid,
                    controller.bid
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
