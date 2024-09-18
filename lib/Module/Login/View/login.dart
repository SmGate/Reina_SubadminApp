import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/Constants/constants.dart';
import 'package:societyadminapp/Module/Login/Controller/login_controller.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/Widgets/my_password_textform_field.dart';
import 'package:societyadminapp/Widgets/my_textform_field.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'package:societyadminapp/utils/style/text_style.dart';

class Login extends GetView {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(44.w, 45.h, 44.w, 0),
                      child: Image.asset(
                        AppImages.logo,
                      ),
                    ),
                    65.ph,
                    Text(
                      "Welcome Back",
                      textAlign: TextAlign.center,
                      style: reusableTextStyle(
                        textStyle: GoogleFonts.dmSans(),
                        fontSize: 36.0,
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    21.ph,
                    Text(
                      "LOGIN TO YOUR ACCOUNT !",
                      textAlign: TextAlign.center,
                      style: reusableTextStyle(
                        textStyle: GoogleFonts.dmSans(),
                        fontSize: 15.0,
                        color: AppColors.dark,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    60.ph,
                    MyTextFormField(
                      textInputType: TextInputType.number,
                      controller: controller.userCnicController,
                      validator: emptyStringValidator,
                      hintText: 'Enter Cnic',
                      labelText: 'Cnic',
                      maxLength: 15,
                      onChanged: (value) {
                        String formattedText = formatText(value);

                        controller.userCnicController.value = TextEditingValue(
                          text: formattedText,
                          selection: TextSelection.collapsed(
                              offset: formattedText.length),
                        );
                      },
                    ),
                    MyPasswordTextFormField(
                        controller: controller.userPasswordController,
                        validator: emptyStringValidator,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        togglePasswordView: controller.togglePasswordView,
                        obscureText: controller.isHidden),
                    18.ph,
                    MyButton(
                      gradient: AppGradients.buttonGradient,
                      loading: controller.loading,
                      height: 43.h,
                      width: 173.w,
                      onPressed: () {
                        if (!controller.loading) {
                          if (_formKey.currentState!.validate()) {
                            if (!controller.loading) {
                              controller.loginApi(
                                  controller.userCnicController.text,
                                  controller.userPasswordController.text);
                            }
                          }
                        }
                      },
                      name: 'Login',
                    ),
                    20.ph,
                  ]),
                ),
              );
            }),
      ),
    );
  }

  /////  formate cnic text

  String formatText(String text) {
    text = text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 15) {
      text = text.substring(0, 15);
    }

    String formattedText = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 5 || i == 12) {
        formattedText += '-';
      }
      formattedText += text[i];
    }

    return formattedText;
  }
}
