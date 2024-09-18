// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/measurement_view_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My_Floating_Button.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../Widget/Dynamic_Conatiner.dart';

class MeasurementView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeasurementViewController>(
        init: MeasurementViewController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.user);

              return true;
            },
            child: DefaultTabController(
              length: 2,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButton: MyFloatingButton(
                    onPressed: () {
                      Get.offNamed(addmeasurements, arguments: controller.user);
                    },
                  ),

                  // IconButton(
                  //     iconSize: MediaQuery.of(context).size.height * 0.065,
                  //     icon: SvgPicture.asset('assets/floatingbutton.svg'),
                  //     onPressed: () {
                  //       Get.offNamed(addmeasurements,
                  //           arguments: controller.user);
                  //     }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Measurement View',
                        onTap: () {
                          Get.offNamed(homescreen, arguments: controller.user);
                        },
                      ),
                      32.ph,
                      Container(
                        margin: EdgeInsets.only(left: 23.w, right: 23.w),
                        width: 329.w,
                        height: 39.h,
                        decoration: ShapeDecoration(
                            color: AppColors.globalWhite,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: AppColors.appThem),
                              borderRadius: BorderRadius.circular(8.r),
                            )),
                        child: TabBar(
                          unselectedLabelColor: Color(0xFF5A5A5A),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          indicator: ShapeDecoration(
                            color: AppColors.appThem,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                          indicatorColor: AppColors.appThem,
                          tabs: [
                            Tab(
                                child: Text(
                              'Houses',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 12.sp),
                            )),
                            Tab(
                              child: Text(
                                'Apartments',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            FutureBuilder(
                                future: controller.housesApartmentsModelApi(
                                    subadminid: controller.user.userid!,
                                    token: controller.user.bearerToken!,
                                    type: 'house'),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DynamicContainer(
                                          heading: 'House details',
                                          unitType:
                                              snapshot.data.data[index].unit,
                                          serviceCharges:
                                              snapshot.data.data[index].charges,
                                          tax: snapshot.data.data[index].tax,
                                          appCharges: snapshot
                                              .data.data[index].appcharges,
                                          area: snapshot.data.data[index].area,
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Icon(Icons.error_outline);
                                  } else {
                                    return CircularIndicatorUnderWhiteBox();
                                  }
                                }),
                            FutureBuilder(
                                future: controller.housesApartmentsModelApi(
                                    subadminid: controller.user.userid!,
                                    token: controller.user.bearerToken!,
                                    type: 'apartment'),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DynamicContainer(
                                          heading: 'Apartments details',
                                          unitType:
                                              snapshot.data.data[index].unit,
                                          serviceCharges:
                                              snapshot.data.data[index].charges,
                                          tax: snapshot.data.data[index].tax,
                                          appCharges: snapshot
                                              .data.data[index].appcharges,
                                          area: snapshot.data.data[index].area,
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Icon(Icons.error_outline);
                                  } else {
                                    return CircularIndicatorUnderWhiteBox();
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
