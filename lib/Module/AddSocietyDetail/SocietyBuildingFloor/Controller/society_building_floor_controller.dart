import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/SocietyBuildingFloor.dart';

class SocietyBuildingFloorsController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var data = Get.arguments;

  String? noofphases;

  int? buildingid;
  int apiCount = 0;
  late final User user;

  late Future<SocietyBuildingFloor> futureFloors;
  @override
  void onInit() {
  
    super.onInit();
    user = data[0];
    buildingid = data[1];

    futureFloors = FloorsApi(buildingid: buildingid!, token: user.bearerToken!);
  }

  Future<SocietyBuildingFloor> FloorsApi(
      {required buildingid, required token}) async {
    print('count ${apiCount++}');
    print("${buildingid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewSocietyBuildingFloors + "/" + buildingid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SocietyBuildingFloor.fromJson(data);
    }

    return SocietyBuildingFloor.fromJson(data);
  }
}
