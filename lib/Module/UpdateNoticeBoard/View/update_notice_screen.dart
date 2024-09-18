// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/app_images.dart';
import '../../../utils/Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/my_button.dart';
import '../../../Widgets/my_textform_field.dart';
import '../Controller/update_notice_controller.dart';

class UpdateNoticeBoardScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateNoticeBoardController>(
        init: UpdateNoticeBoardController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(noticeboardscreen, arguments: controller.userdata);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Update Notice',
                          onTap: () {
                            Get.offNamed(noticeboardscreen,
                                arguments: controller.userdata);
                          },
                        ),
                        20.ph,
                        Image.asset(
                          AppImages.updateEnevts,
                          height: 200,
                        ),
                        20.ph,
                        MyTextFormField(
                          fillColor: Colors.white,
                          controller: controller.noticetitleController,
                          validator: emptyStringValidator,
                          hintText: 'NOTICE TITLE',
                          labelText: 'NOTICE TITLE',
                        ),
                        MyTextFormField(
                          maxLines: 1,
                          fillColor: Colors.white,
                          controller: controller.noticedescriptionController,
                          validator: emptyStringValidator,
                          hintText: 'ENTER DESCRIPTION',
                          labelText: 'ENTER DESCRIPTION',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.NoticeStartDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          fillColor: Colors.white,
                          controller: controller.startnoticedateController,
                          validator: emptyStringValidator,
                          hintText: 'Choose START Date',
                          labelText: 'Choose START Date',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.NoticeEndDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          fillColor: Colors.white,
                          controller: controller.endnoticedateController,
                          validator: emptyStringValidator,
                          hintText: 'Choose END Date',
                          labelText: 'Choose END Date',
                        ),
                        53.ph,
                        MyButton(
                          gradient: AppGradients.buttonGradient,
                          width: MediaQuery.of(context).size.width * 0.4,
                          elevation: 5,
                          loading: controller.isLoading,
                          onPressed: () {
                            if (controller.isLoading == false) {
                              if (controller.formKey.currentState!.validate()) {
                                controller.updateNoticeBoardApi(
                                  noticetitle:
                                      controller.noticetitleController.text,
                                  noticedetail: controller
                                      .noticedescriptionController.text,
                                  startdate:
                                      controller.startnoticedateController.text,
                                  enddate:
                                      controller.endnoticedateController.text,
                                  bearerToken:
                                      controller.userdata!.bearerToken!,
                                  subadminid: controller.userdata!.userid!,
                                  noticeid: controller.notice.id!,
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          textColor: Colors.white,
                          name: 'Update',
                          maxLines: 1,
                        ),
                        35.ph,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
