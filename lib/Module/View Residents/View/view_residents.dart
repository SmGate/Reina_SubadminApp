// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../../../Routes/set_routes.dart';
import '../components/Detail_shown_dialog_box.dart';
import '../components/resident_n_gatekeeper_view_card.dart';
import '../Controller/view_residents_controller.dart';

class ViewResidents extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentController>(
      init: ViewResidentController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.user);

          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                MyBackButton(
                  text: 'Residents',
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.user);
                    Get.deleteAll();
                  },
                ),
                Expanded(
                  child: FutureBuilder(
                      future: controller.viewResidentsApi(
                          controller.userdata.userid!,
                          controller.userdata.bearerToken!),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null &&
                              snapshot.data!.length != 0) {
                            return ListView.builder(
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
                                              insetAnimationCurve: Curves
                                                  .easeInOutCubicEmphasized,
                                              insetAnimationDuration:
                                                  Duration(seconds: 3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: SizedBox(
                                                child: Padding(
                                                  padding: EdgeInsets.all(12),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                      .data![
                                                                          index]
                                                                      .firstname +
                                                                  " " +
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .lastname,
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            18),
                                                              ),
                                                            ),
                                                            5.ph,
                                                            Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .mobileno,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#1A1A1A'),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              16)),
                                                            ),
                                                          ],
                                                        ),
                                                        20.ph,
                                                        DetailShownDialogBox(
                                                          icon:
                                                              AppImages.contact,
                                                          heading: 'Mobile No',
                                                          text: snapshot
                                                              .data![index]
                                                              .mobileno
                                                              .toString(),
                                                          isPng: true,
                                                        ),
                                                        DetailShownDialogBox(
                                                            icon: AppImages
                                                                .address,
                                                            isPng: true,
                                                            heading: 'Address',
                                                            text: snapshot
                                                                .data![index]
                                                                .address),
                                                        DetailShownDialogBox(
                                                            icon: AppImages
                                                                .residentType,
                                                            isPng: true,
                                                            heading:
                                                                'Residental Type',
                                                            text: snapshot
                                                                .data![index]
                                                                .residenttype),
                                                        DetailShownDialogBox(
                                                            icon: AppImages
                                                                .propertytype,
                                                            heading:
                                                                'Property Type',
                                                            isPng: true,
                                                            text: snapshot
                                                                .data![index]
                                                                .propertytype),
                                                        DetailShownDialogBox(
                                                            icon: AppImages
                                                                .carSvg,
                                                            heading:
                                                                'Vehicle No',
                                                            isPng: false,
                                                            text: snapshot
                                                                .data![index]
                                                                .vechileno),
                                                        DetailShownDialogBox(
                                                            icon:
                                                                AppImages.cnic,
                                                            isPng: true,
                                                            heading: 'CNIC',
                                                            text: snapshot
                                                                    .data![
                                                                        index]
                                                                    .cnic ??
                                                                'N/A'),
                                                        MyButton(
                                                          name: "Okay",
                                                          gradient: AppGradients
                                                              .buttonGradient,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: ResidentsNGateKeeperViewCard(
                                      image: Api.imageBaseUrl +
                                          snapshot.data![index].image
                                              .toString(),
                                      name: snapshot.data![index].firstname
                                              .toString() +
                                          " " +
                                          snapshot.data![index].lastname
                                              .toString(),
                                      mobileno: snapshot.data![index].mobileno
                                          .toString(),
                                      showButton: false,
                                    ));
                              },
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return Center(
                                child: Text(
                              'No Residents',
                              style: GoogleFonts.ubuntu(
                                  color: HexColor('#404345'),
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.0015,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ));
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(
                              child: CircularIndicatorUnderWhiteBox());
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
