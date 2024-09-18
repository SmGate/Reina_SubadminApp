// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Bills/Controller/bills_controller.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';

import '../../../Routes/set_routes.dart';

class Bills extends StatelessWidget {
  const Bills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillsController>(
        init: BillsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Bills',
                      onTap: () {
                        Get.offNamed(homescreen,
                            arguments: controller.userdata);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Smart Billing Solutions for\nApartments and Houses",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(generatedhousebills,
                                arguments: controller.user);
                          },
                          child: SizedBox(
                            width: 340,
                            height: 200,
                            child: Card(
                              elevation: 0.8,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Houses Bills",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset(
                                    'assets/houses.svg',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(generatedsocietyapartmentbills,
                                arguments: controller.user);
                          },
                          child: SizedBox(
                            width: 340,
                            height: 200,
                            child: Card(
                              elevation: 0.8,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Apartment Bills",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset(
                                    'assets/apartments.svg',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
