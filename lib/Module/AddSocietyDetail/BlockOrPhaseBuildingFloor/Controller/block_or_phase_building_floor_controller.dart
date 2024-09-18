import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/BlockOrPhaseBuildingFloor.dart';

class BlockOrPhaseBuildingFloorsController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var data = Get.arguments;

  String? noofphases;

  int? buildingid;
  int? dynamicid;

  late final User user;
  final List<TextEditingController> fromController = [];
  final List<TextEditingController> toController = [];
  List<Map<String, dynamic>> myApiData = [];
  bool isLoading = false;
  @override
  void onInit() {
   
    super.onInit();
    user = data[0];
    buildingid = data[1];
    dynamicid = data[2];
  }

  Future<BlockOrPhaseBuildingFloor> FloorsApi(
      {required buildingid, required token}) async {
    

    final response = await Http.get(
      Uri.parse(Api.viewSocietyBuildingFloors + "/" + buildingid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      

      return BlockOrPhaseBuildingFloor.fromJson(data);
    }

    return BlockOrPhaseBuildingFloor.fromJson(data);
  }

}
