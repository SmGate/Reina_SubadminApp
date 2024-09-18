// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';

import '../../component/Custom_Grid.dart';
import '../Controller/street_or_building_controller.dart';

class StreetOrBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreetOrBuildingController>(
        init: StreetOrBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(homescreen, arguments: controller.data);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  body: Column(children: [
                    MyBackButton(
                      text: 'Street Or Building',
                      onTap: () {
                        Get.offAndToNamed(homescreen,
                            arguments: controller.data);
                      },
                    ),
                    16.ph,
                    Expanded(
                      child: GridView(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                        ),
                        children: [
                          CustomGrid(
                              onTap: () async {
                                Get.offNamed(streets,
                                    arguments: controller.data);
                              },
                              text: 'Add Streets'),
                          CustomGrid(
                              onTap: () async {
                                Get.offNamed(societybuildingscreen,
                                    arguments: controller.data);
                              },
                              text: 'Add Buildings'),
                        ],
                      ),
                    )
                  ])),
            ),
          );
        });
  }
}
