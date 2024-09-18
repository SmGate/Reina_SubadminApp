import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Widgets/my_button.dart';

// ignore: must_be_immutable
class AddBuildingCustomScreen extends StatelessWidget {
  AddBuildingCustomScreen({
    required this.fKey,
    required this.appBarText,
    required this.backonTap,
    required this.nameController,
    required this.buttonLoading,
    required this.buttonOnPressed,
  });
  Key? fKey;
  String appBarText;
  void Function()? backonTap;
  TextEditingController? nameController;

  bool buttonLoading = false;
  void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fKey,
      child: ListView(
        children: <Widget>[
          MyBackButton(
            onTap: backonTap,
            text: appBarText,
          ),
          20.ph,
          SizedBox(
            child: Card(
              color: AppColors.globalWhite,
              surfaceTintColor: AppColors.globalWhite,
              elevation: 2,
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        color: Color(0xFFF7F8FA),
                        height: 35.h,
                        width: 150.w,
                        child: Center(
                            child: Text(
                          'Building Name',
                          style: TextStyle(color: HexColor('#535353')),
                        )),
                      ),
                    ),
                    20.ph,
                    Container(
                      width: 200.w,
                      height: 75.h,
                      color: Color.fromRGBO(255, 153, 0, 0.14),
                      child: Center(
                        child: TextFormField(
                          validator: emptyStringValidator,
                          controller: nameController,
                          enabled: true,
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(), //<-- SEE HERE
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    20.ph,
                    MyButton(
                      gradient: AppGradients.buttonGradient,
                      loading: buttonLoading,
                      width: 200.w,
                      height: 37.h,
                      border: 5,
                      onPressed: buttonOnPressed,
                      name: 'Save',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
