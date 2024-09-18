import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

class AddSocietyBuildingFloorsController extends GetxController {
  var data = Get.arguments;
  int? index;
  int? buildingid;
  var bearertoken;
  late final User user;

  bool isLoading = false;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void onInit() {
   
    super.onInit();

    user = data[0];
    buildingid = data[1];
  }

  final fromController = TextEditingController();
  final toController = TextEditingController();

  addSocietybuildingFloorsApi({
    required String bearerToken,
    required int buildingid,
    required String from,
    required String to,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.addSocietyBuildingFloors));
    request.headers.addAll(headers);

    request.fields['from'] = from;
    request.fields['to'] = to;

    request.fields['buildingid'] = buildingid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      Get.snackbar("Floors Add Successfully", "");

      Get.offAndToNamed(societybuildingfloorsscreen,
          arguments: [user, buildingid]);

      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );

      isLoading = false;
      update();
    } else {
      Get.snackbar("Failed to Add Phases", "");
      isLoading = false;
      update();
    }
  }
}
