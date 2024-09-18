// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/loading.dart';

import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';

import '../../../../Widgets/My_Floating_Button.dart';
import '../../component/Custom_List.dart';
import '../Controller/block_or_phase_building_floor_controller.dart';

class BlockOrPhaseBuildingFloorsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockOrPhaseBuildingFloorsController>(
        init: BlockOrPhaseBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(blockbuilding,
                  arguments: [controller.user, controller.dynamicid!]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offAndToNamed(addblockorphasebuildingfloors,
                        arguments: [
                          controller.user,
                          controller.buildingid!,
                          controller.dynamicid!
                        ]);
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Floors',
                        onTap: () {
                          Get.offNamed(blockbuilding, arguments: [
                            controller.user,
                            controller.dynamicid!
                          ]);
                        },
                      ),
                      20.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.FloorsApi(
                                  buildingid: controller.buildingid!,
                                  token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  print(snapshot.data);
                                  print(snapshot.hasData);

                                  print(snapshot.data.data.length);

                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(snapshot.data.data[index].name);
                                      return CustomList(
                                        onTap: () {
                                          Get.offAndToNamed(
                                              blockOrphasebuildingapartmentsscreen,
                                              arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                                controller.buildingid,
                                                controller.dynamicid,
                                              ]);
                                        },
                                        text: snapshot.data.data[index].name
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
