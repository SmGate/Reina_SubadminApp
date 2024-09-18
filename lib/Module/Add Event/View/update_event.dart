// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import 'package:societyadminapp/utils/Constants/constants.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';

import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/Widgets/my_textform_field.dart';
import '../../../Routes/set_routes.dart';
import '../Controller/update_event_controller.dart';

class UpdateEvent extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UpdateEventScreenController>(
            init: UpdateEventScreenController(),
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
                          text: 'Update Event',
                          onTap: () {
                            Get.offNamed(eventsscreen,
                                arguments: controller.user);
                          },
                        ),
                        20.ph,
                        Image.asset(
                          AppImages.updateEnevts,
                          height: 200,
                        ),
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
                          suffixIcon: SvgPicture.asset(AppImages.addEventIcon,
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
                          suffixIcon: SvgPicture.asset(AppImages.addEventIcon,
                              fit: BoxFit.scaleDown),
                          controller: controller.eventEndDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event End Date',
                          labelText: 'End Date',
                        ),
                        43.ph,
                        MyButton(
                          gradient: AppGradients.buttonGradient,
                          width: 180.w,
                          height: 43.h,
                          elevation: 5,
                          loading: controller.isLoading,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.isLoading == false) {
                                print("here");
                                controller.updateEventApi(
                                    token: controller.user.bearerToken!,
                                    eventTitle:
                                        controller.eventTitleController.text,
                                    eventDescription: controller
                                        .eventDescriptionController.text,
                                    eventStartDate: controller
                                        .eventStartDateController.text,
                                    eventEndDate:
                                        controller.eventEndDateController.text,
                                    eventActive: controller.eventActive,
                                    id: controller.eventData!.id!);
                              }
                            } else {
                              return null;
                            }
                          },
                          textColor: Colors.white,
                          //color: primaryColor,
                          name: 'Update Event ',
                          maxLines: 1,
                        ),
                        43.ph,
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
