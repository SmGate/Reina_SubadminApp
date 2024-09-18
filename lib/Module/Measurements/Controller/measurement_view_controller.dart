import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/MeasurementModel.dart';

class MeasurementViewController extends GetxController {
  var userdata = Get.arguments;
  late final User user;

  @override
  void onInit() {
 
    super.onInit();

    user = userdata;
  }

  Future<MeasurementModel> housesApartmentsModelApi(
      {required int subadminid,
      required String token,
      required String type}) async {
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
      return MeasurementModel.fromJson(data);
    }
    return MeasurementModel.fromJson(data);
  }
}
