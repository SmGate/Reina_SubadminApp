// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../AddSocietyDetail/component/Custom_Grid.dart';
import '../Controller/local_building_controller.dart';

class LocalBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalBuildingController>(
        init: LocalBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(homescreen, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Building',
                  onTap: () {
                    Get.offAndToNamed(homescreen, arguments: controller.user);
                  },
                ),
                32.ph,
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.only(left: 28.w, right: 27.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 35,
                        mainAxisSpacing: 15),
                    children: [
                      CustomGrid(
                        onTap: () async {
                          Get.offAndToNamed(localbuildingfloorsscreen,
                              arguments: controller.user);
                        },
                        text: controller.user.societyorbuildingname!.toString(),
                      ),
                    ],
                  ),
                )
              ])),
            ),
          );
        });
  }
}
