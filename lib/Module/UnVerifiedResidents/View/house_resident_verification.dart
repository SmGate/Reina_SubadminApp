// ignore_for_file: deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/block.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/house.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/phases.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/street.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/utils/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/my_button.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import '../Controller/house_resident_verification_controller.dart';
import '../Model/measurement.dart';
import '../Widget/custom_text.dart';
import '../Widget/first_custom_container.dart';

class HouseResidentVerification extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: GetBuilder<HouseResidentVerificationController>(
            init: HouseResidentVerificationController(),
            builder: (controller) {
              return WillPopScope(
                onWillPop: () async {
                  Get.offNamed(unverifiedresident,
                      arguments: controller.userdata);
                  return true;
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(
                        text: 'House Resident Verification',
                        onTap: () {
                          Get.offNamed(unverifiedresident,
                              arguments: controller.userdata);
                        },
                      ),
                      16.ph,

                      //VERIFICATION DETAIL FIRST CARD

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FirstCustomContainer(
                          ImageBaseUrl: Api.imageBaseUrl +
                              controller.resident.image.toString(),
                          Name: controller.resident.firstname.toString() +
                              " " +
                              controller.resident.lastname.toString(),
                          MobileNo: controller.resident.mobileno.toString(),
                          Cnic: controller.resident.cnic.toString(),
                          VehicleNo: controller.resident.vechileno.toString(),
                          ResidentalType:
                              controller.resident.residenttype.toString(),
                          Status: controller.resident.status.toString(),
                        ),
                      ),

                      20.ph,
                      if (controller.resident.society![0].structuretype ==
                          1) ...[
                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomUnverifiedText(text: "Select Street*"),
                              8.ph,

                              DropdownSearch<Street>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllStreetsApi(
                                      dynamicId:
                                          controller.resident.society!.first.id,
                                      type: 'society',
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Street? data) {
                                  controller.SelectedStreet(data);
                                },
                                selectedItem: controller.streets,
                                itemAsString: (Street p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              CustomUnverifiedText(text: "Select House*"),
                              8.ph,

                              DropdownSearch<House>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllHousesApi(
                                      dynamicId: controller.streets?.id,
                                      bearerToken:
                                          controller.userdata.bearerToken,
                                      type: 'street');
                                },
                                onChanged: (House? house) {
                                  controller.SelectedHouse(house);

                                  controller.houseAddressDetailController.text =
                                      "${controller.resident.society!.first.name}${','}${controller.streets!.address}${','}${controller.houses!.address.toString()}";
                                },
                                selectedItem: controller.houses,
                                itemAsString: (House p) {
                                  return p.address.toString();
                                },
                              ),

                              /// House Measurement
                              16.ph,

                              CustomUnverifiedText(
                                text: "Select Area Type*",
                              ),
                              8.ph,
                              DropdownSearch<Measurement>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.housesApartmentsModelApi(
                                      subadminid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      type: 'house');
                                },
                                onChanged: (Measurement? data) {
                                  controller.SelectedMeasurement(data);
                                },
                                selectedItem: controller.measurementModel,
                                itemAsString: (Measurement p) {
                                  return p.area.toString() +
                                      ' ' +
                                      p.unit.toString();
                                },
                              )
                            ],
                          ),
                        ),
                      ] else if (controller
                              .resident.society!.first.structuretype ==
                          2) ...[
                        ///Block
                        ///

                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomUnverifiedText(text: "Select Block*"),
                              8.ph,

                              DropdownSearch<Block>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllBlocksApi(
                                      dynamicId: controller.resident.societyid,
                                      type: 'society',
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Block? data) {
                                  controller.SelectedBlock(data);
                                },
                                selectedItem: controller.blocks,
                                itemAsString: (Block p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              ///Street

                              CustomUnverifiedText(text: "Select Street*"),

                              8.ph,
                              DropdownSearch<Street>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllStreetsApi(
                                      dynamicId: controller.blocks?.id,
                                      type: 'blocks',
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Street? data) {
                                  controller.SelectedStreet(data);
                                },
                                selectedItem: controller.streets,
                                itemAsString: (Street p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              ///House

                              CustomUnverifiedText(text: "Select House*"),

                              8.ph,
                              DropdownSearch<House>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllHousesApi(
                                      dynamicId: controller.streets?.id,
                                      bearerToken:
                                          controller.userdata.bearerToken,
                                      type: 'street');
                                },
                                onChanged: (House? house) {
                                  controller.SelectedHouse(house);

                                  controller.houseAddressDetailController.text =
                                      "${controller.resident.society!.first.name}${','}${controller.blocks!.address}${','}${controller.streets!.address.toString()}${','}${controller.houses!.address.toString()}";
                                },
                                selectedItem: controller.houses,
                                itemAsString: (House p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              /// House Measurement

                              CustomUnverifiedText(
                                text: "Select Area Type*",
                              ),
                              8.ph,
                              DropdownSearch<Measurement>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.housesApartmentsModelApi(
                                      subadminid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      type: 'house');
                                },
                                onChanged: (Measurement? data) {
                                  controller.SelectedMeasurement(data);
                                },
                                selectedItem: controller.measurementModel,
                                itemAsString: (Measurement p) {
                                  return p.area.toString() +
                                      ' ' +
                                      p.unit.toString();
                                },
                              )
                            ],
                          ),
                        ),
                      ] else if (controller
                              .resident.society!.first.structuretype ==
                          3) ...[
                        /// Phase
                        ///
                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomUnverifiedText(
                                text: "Select Phase*",
                              ),
                              8.ph,
                              DropdownSearch<Phase>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllPhasesApi(
                                      dynamicId: controller.resident.societyid,
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Phase? data) {
                                  controller.SelectedPhase(data);
                                },
                                selectedItem: controller.phases,
                                itemAsString: (Phase p) {
                                  return p.address.toString();
                                },
                              ),

                              16.ph,

                              /// Block

                              CustomUnverifiedText(
                                text: "Select Block*",
                              ),
                              8.ph,
                              DropdownSearch<Block>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllBlocksApi(
                                      dynamicId: controller.phases?.id,
                                      type: 'phase',
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Block? data) {
                                  controller.SelectedBlock(data);
                                },
                                selectedItem: controller.blocks,
                                itemAsString: (Block p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              /// Street

                              CustomUnverifiedText(
                                text: "Select Street*",
                              ),
                              8.ph,
                              DropdownSearch<Street>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllStreetsApi(
                                      dynamicId: controller.blocks?.id,
                                      type: 'blocks',
                                      bearerToken:
                                          controller.userdata.bearerToken);
                                },
                                onChanged: (Street? data) {
                                  controller.SelectedStreet(data);
                                },
                                selectedItem: controller.streets,
                                itemAsString: (Street p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              ///House
                              CustomUnverifiedText(
                                text: "Select House*",
                              ),
                              8.ph,

                              DropdownSearch<House>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllHousesApi(
                                      dynamicId: controller.streets?.id,
                                      bearerToken:
                                          controller.userdata.bearerToken,
                                      type: 'street');
                                },
                                onChanged: (House? house) {
                                  controller.SelectedHouse(house);

                                  controller.houseAddressDetailController.text =
                                      "${controller.resident.society!.first.name.toString()}${','}${controller.phases!.address.toString()}${','}${controller.blocks!.address.toString()}${','}${controller.streets!.address.toString()}${','}${controller.houses!.address.toString()}";
                                  ;
                                },
                                selectedItem: controller.houses,
                                itemAsString: (House p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              /// House Measurement

                              CustomUnverifiedText(
                                text: "Select Area Type*",
                              ),
                              8.ph,
                              DropdownSearch<Measurement>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.housesApartmentsModelApi(
                                      subadminid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      type: 'house');
                                },
                                onChanged: (Measurement? data) {
                                  controller.SelectedMeasurement(data);
                                },
                                selectedItem: controller.measurementModel,
                                itemAsString: (Measurement p) {
                                  return p.area.toString() +
                                      ' ' +
                                      p.unit.toString();
                                },
                              )
                            ],
                          ),
                        ),
                      ] else if (controller
                              .resident.society!.first.structuretype ==
                          5) ...[
                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomUnverifiedText(
                                text: "Select House*",
                              ),
                              8.ph,
                              DropdownSearch<House>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.viewAllHousesApi(
                                      dynamicId:
                                          controller.resident.society!.first.id,
                                      bearerToken:
                                          controller.userdata.bearerToken,
                                      type: 'society');
                                },
                                onChanged: (House? house) {
                                  controller.SelectedHouse(house);

                                  controller.houseAddressDetailController.text =
                                      "${controller.resident.society!.first.name}${','} ${controller.houses!.address.toString()}";
                                },
                                selectedItem: controller.houses,
                                itemAsString: (House p) {
                                  return p.address.toString();
                                },
                              ),
                              16.ph,

                              /// House Measurement

                              CustomUnverifiedText(
                                text: "Select Area Type*",
                              ),
                              8.ph,

                              DropdownSearch<Measurement>(
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                asyncItems: (String filter) async {
                                  print(filter);
                                  return controller.housesApartmentsModelApi(
                                      subadminid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      type: 'house');
                                },
                                onChanged: (Measurement? data) {
                                  controller.SelectedMeasurement(data);
                                },
                                selectedItem: controller.measurementModel,
                                itemAsString: (Measurement p) {
                                  return p.area.toString() +
                                      ' ' +
                                      p.unit.toString();
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 20.h),
                        child: Text(
                          controller.houseAddressDetailController.text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            color: AppColors.appThem,
                            fontSize: 14.font,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      20.ph,
                      Center(
                        child: MyButton(
                          gradient: AppGradients.buttonGradient,
                          loading: controller.loading,
                          onPressed: () {
                            if (!controller.loading) {
                              controller.verifyResidentApi(
                                  houseaddress: controller
                                      .houseAddressDetailController.text,
                                  residentid: controller.resident.residentid,
                                  status: 1,
                                  token: controller.userdata.bearerToken!,
                                  bid: controller.blocks?.id ?? 0,
                                  measurementid:
                                      controller.measurementModel!.id,
                                  pid: controller.phases?.id ?? 0,
                                  propertyid: controller.houses!.id!,
                                  sid: controller.streets?.id ?? 0,
                                  vechileno:
                                      controller.vehicleNoController.text);
                            }
                          },
                          name: 'Verify',
                          width: 328.w,
                          height: 52.h,
                          fontSize: 20.font,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      20.ph,
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
