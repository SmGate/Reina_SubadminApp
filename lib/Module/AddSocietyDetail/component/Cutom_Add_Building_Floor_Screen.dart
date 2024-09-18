import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Widgets/my_button.dart';
import '../../../Widgets/my_text.dart';

// ignore: must_be_immutable
class AddBuildingFloorCustom extends StatelessWidget {
  AddBuildingFloorCustom({
    required this.fKey,
    required this.backonTap,
    required this.fromController,
    required this.toController,
    required this.buttonLoading,
    required this.buttonOnPressed,
  });
  Key? fKey;

  void Function()? backonTap;
  TextEditingController? fromController;
  TextEditingController? toController;

  bool buttonLoading = false;
  void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.background,
            body: Form(
              key: fKey,
              child: Column(
                children: <Widget>[
                  MyBackButton(
                    onTap: backonTap,
                    text: 'Add Floors',
                  ),
                  20.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      child: Card(
                        color: AppColors.globalWhite,
                        surfaceTintColor: AppColors.globalWhite,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              20.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MyText(name: 'From Floors'),
                                  MyText(name: 'To Floors')
                                ],
                              ),
                              10.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: TextFormField(
                                      validator: emptyStringValidator,
                                      controller: fromController,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      decoration: InputDecoration(
                                          filled: true,
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            borderSide:
                                                BorderSide(), //<-- SEE HERE
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70.w,
                                    child: TextFormField(
                                      validator: emptyStringValidator,
                                      controller: toController,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      decoration: InputDecoration(
                                          filled: true,
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            borderSide:
                                                BorderSide(), //<-- SEE HERE
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                              40.ph,
                              MyButton(
                                gradient: AppGradients.buttonGradient,
                                loading: buttonLoading,
                                onPressed: buttonOnPressed,
                                name: 'Save',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
