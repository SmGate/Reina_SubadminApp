// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Controller/view_finance_manager_controller.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Model/FinanceManagerModel.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';
import '../../../../Routes/set_routes.dart';
import '../../../View Residents/components/Detail_shown_dialog_box.dart';
import '../../../../Widgets/my_dialog_box.dart';
import '../../../View Residents/components/resident_n_gatekeeper_view_card.dart';

class ViewFinanceManager extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewFinanceManagerController>(
      init: ViewFinanceManagerController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          await Get.offNamed(homescreen, arguments: controller.userdata);

          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                MyBackButton(
                  text: "Finance Managers",
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.userdata);
                  },
                ),
                16.ph,
                Expanded(
                  child: FutureBuilder<FinanceManagerModel>(
                      future: controller.financeManagerViewApi(
                          subAdminId: controller.user.userid!,
                          bearerToken: controller.user.bearerToken,
                          context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<FinanceManagerModel> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor:
                                              AppColors.globalWhite,
                                          surfaceTintColor:
                                              AppColors.globalWhite,
                                          insetAnimationCurve: Curves.bounceIn,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: SizedBox(
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        snapshot
                                                                .data!
                                                                .data![index]
                                                                .firstname! +
                                                            " " +
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .lastname!,
                                                        style:
                                                            reusableTextStyle(
                                                          textStyle: GoogleFonts
                                                              .dmSans(),
                                                          fontSize: 18.0,
                                                          color: AppColors
                                                              .textBlack,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      10.ph,
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .data![index]
                                                            .mobileno!,
                                                        style:
                                                            reusableTextStyle(
                                                          textStyle: GoogleFonts
                                                              .dmSans(),
                                                          fontSize: 16.0,
                                                          color: AppColors.dark,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  20.ph,
                                                  DetailShownDialogBox(
                                                    icon: AppImages.person,
                                                    isPng: true,
                                                    heading: 'Name',
                                                    text: snapshot
                                                            .data!
                                                            .data![index]
                                                            .firstname! +
                                                        " " +
                                                        snapshot
                                                            .data!
                                                            .data![index]
                                                            .lastname!,
                                                  ),
                                                  DetailShownDialogBox(
                                                      icon: AppImages.contact,
                                                      isPng: true,
                                                      heading: 'Mobile No',
                                                      text: snapshot.data!
                                                          .data![index].mobileno
                                                          .toString()),
                                                  DetailShownDialogBox(
                                                      icon: AppImages.address,
                                                      isPng: true,
                                                      heading: 'Address',
                                                      text: snapshot
                                                          .data!
                                                          .data![index]
                                                          .address),
                                                  DetailShownDialogBox(
                                                      icon: AppImages.cnic,
                                                      isPng: true,
                                                      heading: 'CNIC',
                                                      text: snapshot.data!
                                                          .data![index].cnic)
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: ResidentsNGateKeeperViewCard(
                                  image: Api.imageBaseUrl +
                                      snapshot.data!.data![index].image
                                          .toString(),
                                  name: snapshot.data!.data![index].firstname
                                      .toString(),
                                  mobileno: snapshot.data!.data![index].mobileno
                                      .toString(),
                                  DeleteDialogPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomDialog(
                                            image: SvgPicture.asset(
                                                "assets/showdialog_delete_icon.svg",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06),
                                            negativeBtnPressed: () {
                                              Get.back();
                                            },
                                            title: "Are you sure !",
                                            content:
                                                "Do you want to delete this?",
                                            positiveBtnText: "Delete",
                                            negativeBtnText: "Cancel",
                                            positiveBtnPressed: () async {
                                              controller
                                                  .financeManagerDeleteApi(
                                                      financeManagerId: snapshot
                                                          .data!
                                                          .data![index]
                                                          .financemanagerid,
                                                      bearerToken: controller
                                                          .user.bearerToken,
                                                      context: context);
                                              Get.back();
                                            },
                                          );
                                        });
                                  },
                                  updateOnPressed: () {
                                    print(snapshot
                                        .data!.data![index].runtimeType);

                                    Get.offNamed(updateFinanceManager,
                                        arguments: [
                                          controller.user,
                                          snapshot.data!.data![index]
                                        ]);
                                    //
                                  },
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return CircularIndicatorUnderWhiteBox();
                        }
                      }),
                )
              ],
            ),
            floatingActionButton: Container(
              decoration: BoxDecoration(
                  gradient: AppGradients.floatingbuttonGradient,
                  shape: BoxShape.circle),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 50,
                    color: AppColors.globalWhite,
                  ),
                  onPressed: () {
                    Get.offAndToNamed(addFinanceManager,
                        arguments: controller.user);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
