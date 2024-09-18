// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/voting/controller/voting_controller.dart';
import 'package:societyadminapp/Module/voting/model/get_all_poll_model.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/custom_card.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';

import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

class VotingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var votingController = Get.find<VotingController>();
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(homescreen, arguments: votingController.user);

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              MyBackButton(
                text: "Votings",
                onTap: () {
                  Get.offNamed(homescreen, arguments: votingController.user);
                },
              ),
              Expanded(
                  child: FutureBuilder<GetAllPollModel>(
                future: votingController.getAllPoll(
                    societyId: votingController.userdata!.societyid.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularIndicatorUnderWhiteBox());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount:
                            votingController.getAllPollModel.data?.length,
                        itemBuilder: (context, index) {
                          var data =
                              votingController.getAllPollModel.data?[index];
                          return CustomCard(
                              boxShadow: BoxShadow(),
                              margin: EdgeInsets.only(
                                  top: index == 0 ? 20 : 10,
                                  left: 20,
                                  right: 20),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppImages.question,
                                          height: 35,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            data?.title ?? "",
                                            style: reusableTextStyle(
                                              textStyle: GoogleFonts.dmSans(),
                                              fontSize: 16.0,
                                              color: AppColors.textBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow
                                                .ellipsis, // Optional: adds ellipsis if text overflows
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 200,
                                      // color: Colors.red,
                                      child: ListView.builder(
                                        itemCount: votingController
                                            .getAllPollModel
                                            .data?[index]
                                            .results!
                                            .length,
                                        itemBuilder: (context, i) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppImages.noticeBoard,
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Option",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColors.textBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    votingController
                                                            .getAllPollModel
                                                            .data?[index]
                                                            .results![i]
                                                            .option
                                                            .toString() ??
                                                        "",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color: AppColors.dark,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppImages.vote,
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Votes",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColors.textBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    votingController
                                                            .getAllPollModel
                                                            .data?[index]
                                                            .results![i]
                                                            .votes
                                                            .toString() ??
                                                        "",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color: AppColors.dark,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.percent),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Percentage",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColors.textBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    "${votingController.getAllPollModel.data?[index].results![i].percentage.toString() ?? ""} %",
                                                    style: reusableTextStyle(
                                                      textStyle:
                                                          GoogleFonts.dmSans(),
                                                      fontSize: 14.0,
                                                      color: AppColors.dark,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                              i ==
                                                      (votingController
                                                                  .getAllPollModel
                                                                  .data?[index]
                                                                  .results
                                                                  ?.length ??
                                                              0) -
                                                          1
                                                  ? SizedBox()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Divider(),
                                                    )
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else {
                    return Center(child: Text("No Data"));
                  }
                },
              ))
            ],
          ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
                gradient: AppGradients.floatingbuttonGradient,
                shape: BoxShape.circle),
            child: IconButton(
                // padding: EdgeInsets.only(top: 85.w),
                iconSize: 40.w,
                icon: Icon(
                  Icons.add,
                  weight: 30,
                  color: AppColors.globalWhite,
                ),
                onPressed: () {
                  Get.toNamed(createPoll, arguments: votingController.user);
                }),
          ),
        ),
      ),
    );
  }
}
