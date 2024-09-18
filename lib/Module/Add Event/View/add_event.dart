// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Constants/constants.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/Widgets/my_textform_field.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../Routes/set_routes.dart';
import '../../../utils/CustomImagePicker/custom_image_picker.dart';
import '../../../Widgets/UpIcon/up_icon.dart';
import '../Controller/add_event_controller.dart';

class AddEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<AddEventScreenController>(
            init: AddEventScreenController(),
            builder: (controller) {
              return WillPopScope(
                onWillPop: () async {
                  Get.offNamed(eventsscreen, arguments: controller.user);

                  return true;
                },
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Add Event',
                          onTap: () {
                            Get.offNamed(eventsscreen,
                                arguments: controller.user);
                          },
                        ),
                        32.ph,

                        CustomImagePickerGallery(
                          backgroundImage: controller.imageFile == null
                              ? AssetImage('assets/banner.png') as ImageProvider
                              : FileImage(
                                  File(controller.imageFile!.path),
                                ),
                          galOnPressed: () {
                            controller.getFromGallery(ImageSource.gallery);
                          },
                        ),
                        // SvgPicture.asset(
                        //   "assets/event_vector.svg",
                        // ),
                        20.ph,
                        MyTextFormField(
                          controller: controller.eventTitleController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Title',
                          labelText: 'Event Title',
                        ),
                        MyTextFormField(
                          controller: controller.eventDescriptionController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Description',
                          labelText: 'Event Description',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.StartDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          controller: controller.eventStartDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Start Date',
                          labelText: 'Start Date',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.EndDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          controller: controller.eventEndDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event End Date',
                          labelText: 'End Date',
                        ),
                        MyTextFormField(
                          controller: controller.startTimeController,
                          validator: emptyStringValidator,
                          labelText: 'Start Time ',
                          hintText: 'Start Time',
                          readOnly: true,
                          onTap: () {
                            controller.selectStartTime(context);
                          },
                        ),
                        MyTextFormField(
                          controller: controller.endTimeController,
                          validator: emptyStringValidator,
                          labelText: 'End Time ',
                          hintText: 'End Time',
                          readOnly: true,
                          onTap: () {
                            controller.selectEndTime(context);
                          },
                        ),
                        53.ph,
                        MyButton(
                          gradient: AppGradients.buttonGradient,
                          loading: controller.isLoading,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.isLoading == false) {
                                controller.addEvent(
                                    file: controller.imageFile!,
                                    startTime: controller.startTime!,
                                    endTime: controller.endTime!,
                                    userid: controller.userdata.userid!,
                                    token: controller.userdata.bearerToken!,
                                    eventTitle:
                                        controller.eventTitleController.text,
                                    eventDescription: controller
                                        .eventDescriptionController.text,
                                    eventStartDate: controller
                                        .eventStartDateController.text,
                                    eventEndDate:
                                        controller.eventEndDateController.text);
                              }
                            } else {
                              return null;
                            }
                          },
                          textColor: Colors.white,
                          color: primaryColor,
                          name: 'Save Event',
                          maxLines: 1,
                        ),
                        35.ph,
                        UpIcon(),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
