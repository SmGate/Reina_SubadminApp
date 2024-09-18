import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

class AddLocalBuildingFloorsController extends GetxController {
  var data = Get.arguments;
  int? index;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  late final User user;

  bool isLoading = false;

  @override
  void onInit() {
   
    super.onInit();

    user = data;
  }

  final fromController = TextEditingController();
  final toController = TextEditingController();

  addLocalbuildingFloorsApi({
    required String bearerToken,
    required int buildingid,
    required int subadminid,
    required String from,
    required String to,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.addLocalBuildingFloors));
    request.headers.addAll(headers);

    request.fields['from'] = from;
    request.fields['to'] = to;

    request.fields['buildingid'] = buildingid.toString();
    request.fields['subadminid'] = subadminid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Floors Add Successfully", "");

      Get.offAndToNamed(localbuildingfloorsscreen, arguments: user);
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
