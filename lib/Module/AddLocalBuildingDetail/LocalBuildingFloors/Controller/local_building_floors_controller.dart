import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/LocalBuildingFloor.dart';

class LocalBuildingFloorsController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var data = Get.arguments;

  String? noofphases;

  int? buildingid;
  late final User user;
  final List<TextEditingController> fromController = [];
  final List<TextEditingController> toController = [];
  List<Map<String, dynamic>> myApiData = [];
  bool isLoading = false;
  @override
  void onInit() {
   
    super.onInit();
    user = data;
  }

  Future<LocalBuildingFloor> FloorsApi(
      {required buildingid, required token}) async {
    print("${buildingid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewLocalBuildingFloors + "/" + buildingid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return LocalBuildingFloor.fromJson(data);
    }

    return LocalBuildingFloor.fromJson(data);
  }
}
