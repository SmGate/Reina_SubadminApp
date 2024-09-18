// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../../Routes/set_routes.dart';

import '../../../../Widgets/My_Floating_Button.dart';
import '../../component/Custom_Grid.dart';
import '../Controller/block_or_phase_building_apartment_controller.dart';

class BlockOrPhaseBuildingApartmentsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockOrPhaseBuildingApartmentsController>(
        init: BlockOrPhaseBuildingApartmentsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(blockorphasebuildingfloorsscreen, arguments: [
                controller.user,
                controller.bid,
                controller.dynamicid
              ]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(
                    onPressed: () {
                      Get.offAndToNamed(addblockorphasebuildingapartmentsscreen,
                          arguments: [
                            controller.user,
                            controller.fid,
                            controller.bid,
                            controller.dynamicid,
                          ]);
                    },
                  ),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Apartments',
                        onTap: () {
                          Get.offAndToNamed(blockorphasebuildingfloorsscreen,
                              arguments: [
                                controller.user,
                                controller.bid,
                                controller.dynamicid
                              ]);
                        },
                      ),
                      16.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.SocietyBuildingApartmentsApi(
                                  fid: controller.fid!,
                                  bearerToken: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
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
                                        onTap: () {},
                                        text: snapshot.data.data[index].name
                                            .toString(),
                                        image: SvgPicture.asset(
                                          'assets/apartmentsvg.svg',
                                          color: HexColor('ff7f00'),
                                          height: 40.h,
                                          width: 40.w,
                                        ),
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
