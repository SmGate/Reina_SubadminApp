// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../components/reports_screen_card.dart';
import '../Controller/reported_resident_controller.dart';
import '../Model/ReportedResident.dart';

class ReportedResidentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentsListController>(
      init: ResidentsListController(),
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
                  text: 'Reported Residents',
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.user);
                  },
                ),
                Expanded(
                  child: FutureBuilder<List<ReportedResident>>(
                      future: controller.viewResidentsApi(
                          controller.userdata.userid!,
                          controller.userdata.bearerToken!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null &&
                              snapshot.data!.length != 0) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return ReportsScreenCard(
                                  img: Api.imageBaseUrl +
                                      snapshot.data![index].image.toString(),
                                  heading: snapshot.data![index].firstname
                                          .toString() +
                                      ' ' +
                                      snapshot.data![index].lastname.toString(),
                                  heading1:
                                      snapshot.data![index].title.toString(),
                                  heading2: snapshot.data![index].mobileno,
                                  showIcon: false,
                                  buttonName: 'Reports',
                                  color: primaryColor,
                                  onPressed: () {
                                    Get.offNamed(userreportslistscreen,
                                        arguments: [
                                          controller.user,
                                          snapshot.data![index].userid,
                                          snapshot.data![index].firstname,
                                          snapshot.data![index].lastname,
                                          snapshot.data![index].address,
                                          snapshot.data![index].mobileno,
                                        ]);
                                  },
                                );
                              },
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return Center(
                                child: Text('No Reports',
                                    style: GoogleFonts.ubuntu(
                                        color: HexColor('#404345'),
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.0015,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)));
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
