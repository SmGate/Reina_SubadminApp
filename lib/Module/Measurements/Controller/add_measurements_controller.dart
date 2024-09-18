import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';
import '../../../Routes/set_routes.dart';
import '../Model/MeasurementModel.dart';

class AddMeasurementController extends GetxController {
  String? propertyVal;
  String? unitVal;
  bool isLoading = false;
  final TextEditingController chargesController = TextEditingController();
  final TextEditingController chargesAfterDueDateController =
      TextEditingController();
  final TextEditingController lateChargesController = TextEditingController();
  final TextEditingController appChargesController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  var userdata = Get.arguments;
  late final User user;
  final formKey = new GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    user = userdata;
  }

  String? unitLabel;

  bool isArea = false;
  List<String> property_types = ['house', 'apartment'];
  List<String> measurements_types = [];

  setPropertyVal(val) {
    propertyVal = val;
    update();
  }

  setMeasurementVal(val) {
    unitVal = val;
    update();
  }

  setArea() {
    isArea = true;
    update();
  }

  Future addMeasurementApi({
    required int userid,
    required String bearerToken,
    required String propertyType,
    required String unitType,
    required String charges,
    required String area,
    required String lateCharges,
    required String appCharges,
    required String tax,
  }) async {
    isLoading = true;
    update();
    final response = await Http.post(
      Uri.parse(Api.addMeasurement),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
      body: jsonEncode(<String, dynamic>{
        "subadminid": userid,
        'type': propertyType,
        'unit': unitType,
        'charges': charges,
        'area': area,
        "status": 0,
        "latecharges": lateCharges,
        "appcharges": double.tryParse(appCharges),
        "tax": tax
      }),
    );

    if (response.statusCode == 200) {
      Get.snackbar("Successful", "Measurement Added !");
      isLoading = false;
      update();
      propertyVal = null;
      unitVal = null;
      clearText();

      Get.offNamed(measurementview, arguments: user);
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());
      (data['errors'] as List)
          .map((e) => Get.snackbar(
                "Error",
                e.toString(),
              ))
          .toList();

      propertyVal = null;
      unitVal = null;

      chargesController.clear();
      areaController.clear();
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
      Get.snackbar("Error", "Failed to Add Measurement");
    }
  }

  Future<MeasurementModel> housesApartmentsModelApi(
      {required int subadminid,
      required String token,
      required String type}) async {
    isLoading = true;
    update();
    final response = await Http.get(
      Uri.parse(Api.housesApartmentMeasurements +
          "/" +
          subadminid.toString() +
          "/" +
          type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      isLoading = false;
      update();
      return MeasurementModel.fromJson(data);
    }
    return MeasurementModel.fromJson(data);
  }

  calculate(servicecharges) {
    double? serviceCharges = double.tryParse(servicecharges) ?? 0.0;
    double app_percentage = 2;
    double tax_percentage = 15;
    double after_due_date_fine = 0.05;
    double app_charges = serviceCharges * (app_percentage / 100);
    double tax_charges = serviceCharges * (tax_percentage / 100);
    double late_charges = (serviceCharges * after_due_date_fine);
    double after_duedate_charges =
        (serviceCharges * after_due_date_fine) + serviceCharges;

    taxController.text = tax_charges.toString();
    appChargesController.text = app_charges.toString();
    chargesAfterDueDateController.text = after_duedate_charges.toString();
    lateChargesController.text = late_charges.toString();

    update();
  }

  clearText() {
    taxController.text = '';
    appChargesController.text = '';
    chargesAfterDueDateController.text = '';
    chargesController.text = '';
    areaController.text = '';
    update();
  }
}
