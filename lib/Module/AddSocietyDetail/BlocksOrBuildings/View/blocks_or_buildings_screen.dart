import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:societyadminapp/Widgets/my_back_button.dart';
import '../../../../Model/User.dart';
import '../../../../Routes/set_routes.dart';

import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Controller/blocks_or_buildings_controller.dart';

class BlockOrBuilding extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockOrBuildingController>(
        init: BlockOrBuildingController(),
        builder: (controller) {
          return Scaffold(
              body: Column(children: [
            MyBackButton(
              text: 'Block Or Building',
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 35,
                        mainAxisSpacing: 15),
                    children: [
                      GestureDetector(
                        onTap: () async {
                          User user = await MySharedPreferences.getUserData();
                          Get.toNamed(blocks,
                              arguments: [controller.pid, user.bearerToken]);
                        },
                        child: Card(
                          elevation: 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        HexColor('#FFFFFF'),
                                        HexColor('#FF9900')
                                      ]),
                                ),
                                child: Image(
                                    image: AssetImage('assets/phasepic.png')),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Add Blocks',
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,

                                    // color: secondaryColor,

                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: HexColor('#FF9900')),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          User user = await MySharedPreferences.getUserData();
                          Get.toNamed(societybuildingscreen,
                              arguments: [controller.pid, user.bearerToken]);
                        },
                        child: Card(
                          elevation: 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        HexColor('#FFFFFF'),
                                        HexColor('#FF9900')
                                      ]),
                                ),
                                child: Image(
                                    image: AssetImage('assets/phasepic.png')),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Add Buildings',
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,

                                    // color: secondaryColor,

                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: HexColor('#FF9900')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ]));
        });
  }
}
