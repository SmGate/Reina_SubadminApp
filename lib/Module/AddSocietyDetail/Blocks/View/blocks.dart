// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Controller/block_controller.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/component/Custom_List.dart';
import 'package:societyadminapp/Widgets/empty_list.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My_Floating_Button.dart';

class Blocks extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlocksController>(
        init: BlocksController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 2) {
                Get.offNamed(blockorsocietybuilding,
                    arguments: controller.user);
              } else {
                Get.offNamed(phasebuildingorblock,
                    arguments: [controller.user, controller.phaseid]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    if (controller.user.structureType == 2) {
                      Get.offNamed(addblocks, arguments: controller.user);
                    } else if (controller.user.structureType == 3) {
                      Get.offNamed(addblocks,
                          arguments: [controller.user, controller.phaseid]);
                    }
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Blocks',
                        onTap: () {
                          if (controller.user.structureType == 2) {
                            Get.offNamed(blockorsocietybuilding,
                                arguments: controller.user);
                          } else {
                            Get.offNamed(phasebuildingorblock, arguments: [
                              controller.user,
                              controller.phaseid
                            ]);
                          }
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 2)
                                  ? controller.blocksApi(
                                      dynamicid: controller.user.societyid!,
                                      bearerToken: controller.user.bearerToken!)
                                  : controller.blocksApi(
                                      dynamicid: controller.phaseid,
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
                                        return CustomList(
                                          onTap: () {
                                            if (controller.user.structureType ==
                                                2) {
                                              Get.offNamed(
                                                  blockbuildingorstreet,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot.data.data[index].id
                                                  ]);
                                            } else {
                                              Get.offNamed(streets, arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                                controller.phaseid
                                              ]);
                                            }
                                          },
                                          text: snapshot
                                              .data.data[index].address
                                              .toString(),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(
                                      name: 'No Blocks',
                                    );
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
