// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

class AddPhasesController extends GetxController {
  var data = Get.arguments;
  int? index;
  late final User user;

  bool isLoading = false;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void onInit() {
  
    super.onInit();
    user = data;
  }

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final addressController = TextEditingController();

  addPhaseApi({
    required String bearerToken,
    required int subadminid,
    required int societyid,
    required int superadminid,
    required int dynamicid,
    required String from,
    required String to,
    required String address,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addPhases));
    request.headers.addAll(headers);

    request.fields['from'] = from;

    request.fields['to'] = to;
    request.fields['address'] = address;

    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['superadminid'] = superadminid.toString();
    request.fields['dynamicid'] = dynamicid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      print(response.body);
      Get.snackbar("Phases Add Successfully", "");

      Get.offNamed(phasess, arguments: user);
      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());
      (data['errors'] as List)
          .map((e) => Get.snackbar(
                "Error",
                e.toString(),
              ))
          .toList();
      isLoading = false;
      update();
    } else {
      Get.snackbar("Failed to Add Phases", "");
      isLoading = false;
      update();
    }
  }
}
