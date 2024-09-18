// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/Society%20Apartment%20Bills/Controller/generate_society_apartment_bills_controller.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';

import '../../../utils/Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/my_button.dart';
import '../../../Widgets/my_textform_field.dart';

class GenerateSocietyApartmentBills extends GetView {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateSocietyApartmentBillsController>(
        init: GenerateSocietyApartmentBillsController(),
        builder: (controller) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(generatedsocietyapartmentbills,
                    arguments: controller.user);
                return true;
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyBackButton(
                          text: 'Generate Apartments Bill',
                          onTap: () {
                            Get.offAndToNamed(generatedsocietyapartmentbills,
                                arguments: controller.user);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SvgPicture.asset(
                          "assets/notices_vector.svg",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.chooseBillStartDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          fillColor: Colors.white,
                          controller: controller.bill_start_date,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill Start Date',
                          labelText: 'Choose Bill Start Date',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.chooseBillEndDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          fillColor: Colors.white,
                          controller: controller.bill_end_date,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill END Date',
                          labelText: 'Choose Bill END Date',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.chooseBillDueDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          fillColor: Colors.white,
                          controller: controller.bill_due_date,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill Due Date',
                          labelText: 'Choose Bill Due Date',
                        ),
                        MyButton(
                          name: 'Generate',
                          onPressed: controller.isLoading
                              ? null
                              : () async {
                                  print(controller.user.userid);
                                  print(controller.bill_start_date.text);
                                  print(controller.bill_end_date.text);
                                  print(controller.bill_due_date.text);
                                  print(controller.status);

                                  await controller
                                      .generateSocietyApartmentBillApi(
                                          billstartdate:
                                              controller.bill_start_date.text,
                                          billenddate:
                                              controller.bill_end_date.text,
                                          duedate:
                                              controller.bill_due_date.text,
                                          status: controller.status,
                                          bearerToken:
                                              controller.user.bearerToken!,
                                          subadminid: controller.user.userid!);
                                },
                        )
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
