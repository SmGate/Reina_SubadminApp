// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../../Routes/set_routes.dart';
import '../../component/Cutom_Add_Building_Screen.dart';
import '../Controller/add_block_building_controller.dart';

class AddBlockBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBlockBuildingController>(
        init: AddBlockBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(blockbuilding,
                  arguments: [controller.user, controller.bid]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  body: AddBuildingCustomScreen(
                    fKey: controller.formKey,
                    appBarText: 'Add Block Building',
                    backonTap: () {
                      Get.offAndToNamed(blockbuilding,
                          arguments: [controller.user, controller.bid]);
                    },
                    nameController: controller.societyBuildingNameController,
                    buttonLoading: controller.isLoading,
                    buttonOnPressed: () {
                      // print(controller.user.userid);
                      // print(controller.user.bearerToken);

                      if (!controller.isLoading) {
                        controller.addSocietyBuildingApi(
                          dynamicid: controller.bid!,
                          societyid: controller.user.societyid!,
                          subadminid: controller.user.userid!,
                          superadminid: controller.user.superadminid!,
                          bearerToken: controller.user.bearerToken!,
                          BuildingName: controller
                              .societyBuildingNameController.text
                              .toString(),
                        );
                      }
                    },
                  )),
            ),
          );
        });
  }
}
