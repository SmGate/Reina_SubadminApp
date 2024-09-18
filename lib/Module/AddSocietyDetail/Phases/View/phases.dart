// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Phases/Controller/phases_controller.dart';
import 'package:societyadminapp/Widgets/empty_list.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My_Floating_Button.dart';
import '../../component/Custom_Grid.dart';

class Phases extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhasesController>(
        init: PhasesController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(phaseorsocietybuilding, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offNamed(addphases, arguments: controller.user);
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Phases',
                        onTap: () {
                          Get.offNamed(phaseorsocietybuilding,
                              arguments: controller.user);
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.phasesApi(
                                  societyid: controller.user.societyid!,
                                  token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null &&
                                      snapshot.data.data.length != 0) {
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
                                            Get.offNamed(phasebuildingorblock,
                                                arguments: [
                                                  controller.user,
                                                  snapshot.data.data[index].id,
                                                ]);
                                          },
                                          text: snapshot
                                              .data.data[index].address
                                              .toString(),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(
                                      name: 'No Phases',
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
