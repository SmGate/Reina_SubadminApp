// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/AddGateKepeer/Controller/add_gate_kepeer_controller.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../utils/CustomImagePicker/custom_image_picker.dart';
import '../../../Widgets/my_button.dart';
import '../../../Widgets/my_password_textform_field.dart';
import '../../../Widgets/my_textform_field.dart';
import '../../../Widgets/UpIcon/up_icon.dart';

class AddGateKeeper extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<AddGateKeeperScreenController>(
            init: AddGateKeeperScreenController(),
            builder: (controller) {
              return WillPopScope(
                onWillPop: () async {
                  Get.offNamed(gatekeeperscreen, arguments: controller.user);

                  return true;
                },
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MyBackButton(
                            text: 'Add Gatekeeper',
                            onTap: () {
                              Get.offNamed(gatekeeperscreen,
                                  arguments: controller.user);
                            },
                          ),
                          25.35.ph,
                          CustomImagePicker(
                            backgroundImage: controller.imageFile == null
                                ? AssetImage(AppImages.user) as ImageProvider
                                : FileImage(
                                    File(controller.imageFile!.path),
                                  ),
                            camOnPressed: () {
                              controller.getFromCamera(ImageSource.camera);
                            },
                            galOnPressed: () {
                              controller.getFromGallery(ImageSource.gallery);
                            },
                          ),
                          31.96.ph,
                          MyTextFormField(
                            controller: controller.fNameController,
                            validator: emptyStringValidator,
                            hintText: 'First Name',
                            labelText: 'First Name',
                          ),
                          MyTextFormField(
                            controller: controller.lNameController,
                            validator: emptyStringValidator,
                            hintText: 'Last Name',
                            labelText: 'Last Name',
                          ),
                          MyTextFormField(
                            textInputType: TextInputType.number,
                            controller: controller.cnicController,
                            validator: emptyStringValidator,
                            hintText: 'Cnic',
                            labelText: 'Cnic',
                            maxLength: 15,
                            onChanged: (value) {
                              String formattedText = formatText(value);

                              controller.cnicController.value =
                                  TextEditingValue(
                                text: formattedText,
                                selection: TextSelection.collapsed(
                                    offset: formattedText.length),
                              );
                            },
                          ),
                          MyTextFormField(
                            controller: controller.addressController,
                            validator: emptyStringValidator,
                            hintText: 'Address',
                            labelText: 'Address',
                          ),
                          MyTextFormField(
                            textInputType: TextInputType.number,
                            controller: controller.mobilenoController,
                            validator: emptyStringValidator,
                            hintText: 'Mobile No',
                            labelText: 'Mobile No ',
                          ),
                          MyTextFormField(
                            textInputType: TextInputType.number,
                            controller: controller.gatenoController,
                            validator: emptyStringValidator,
                            hintText: 'Gate No',
                            labelText: 'Gate No ',
                          ),
                          MyPasswordTextFormField(
                            maxLines: 1,
                            controller: controller.passwordController,
                            obscureText: controller.isHidden,
                            togglePasswordView: controller.togglePasswordView,
                            validator: emptyStringValidator,
                            hintText: 'Enter Password',
                            labelText: 'Password',
                          ),
                          56.ph,
                          MyButton(
                            loading: controller.isLoading,
                            gradient: AppGradients.buttonGradient,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.isLoading == false) {
                                  if (controller.imageFile?.path == null) {
                                    Get.snackbar(
                                        'Warning', 'Select an image !');
                                  } else {
                                    controller.addGateKeeperApi(
                                        file: controller.imageFile!,
                                        fName: controller.fNameController.text,
                                        lName: controller.lNameController.text,
                                        cnic: controller.cnicController.text,
                                        address:
                                            controller.addressController.text,
                                        mobileno:
                                            controller.mobilenoController.text,
                                        gateno:
                                            controller.gatenoController.text,
                                        password:
                                            controller.passwordController.text,
                                        bearerToken:
                                            controller.user!.bearerToken!,
                                        subadminid: controller.user!.userid!,
                                        societyid: controller.user!.societyid!);
                                  }
                                }
                              }
                            },
                            name: 'Save',
                          ),
                          32.ph,
                          UpIcon(),
                          18.2.ph,
                        ],
                      ),
                    ),
                  ),
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
