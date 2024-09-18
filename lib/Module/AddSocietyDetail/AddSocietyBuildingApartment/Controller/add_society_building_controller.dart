import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

class AddSocietyBuildingApartmentsController extends GetxController {
  var argumnet = Get.arguments;
  int? fid;
  int? bid;

  bool isLoading = false;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  late final User user;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
  

    super.onInit();

    user = argumnet[0];
    fid = argumnet[1];
    bid = argumnet[2];
  }

  addApartmentsApi({
    required String bearerToken,
    required int fid,
    required String from,
    required String to,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest(
        'POST', Uri.parse(Api.addSocietyBuildingApartments));
    request.headers.addAll(headers);
    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['societybuildingfloorid'] = fid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      Get.snackbar("Apartments Add Successfully", "");
      Get.offAndToNamed(societybuildingapartmentscreen,
          arguments: [user, fid, bid]);

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
      Get.snackbar("Failed to Add Apartments", "");
      isLoading = false;
      update();
    }
  }
}
