import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';

class AddStreetsController extends GetxController {
  var data = Get.arguments;
  // int? bid;
  // int? pid;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool isLoading = false;
  String? bearerToken;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final addressController = TextEditingController();
  User user = User(
      structureType: 0,
      userid: 0,
      image: '',
      societyid: 0,
      subadminid: 0,
      firstName: '',
      lastName: '',
      cnic: '',
      roleId: 0,
      roleName: '',
      bearerToken: '',
      address: '',
      mobileno: '',
      fcmtoken: '',
      superadminid: 0,
      created_at: '',
      updated_at: '');

  int? blockid;
  int? phaseid;

  @override
  void onInit() {
  

    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      super.onInit();

      user = await MySharedPreferences.getUserData();
      if (user.structureType == 1) {
        user = data;
      } else if (user.structureType == 2) {
        user = data[0];
        blockid = data[1];
      } else if (user.structureType == 3) {
        user = data[0];
        blockid = data[1];
        phaseid = data[2];
      }

      update();
    });

    // if (user.structureType == 1) {
    //   user = data;
    // } else {
    //   user = data[0];
    //   blockid = data[1];
    // }
  }

  addStreetsApi({
    required String bearerToken,
    required int subadminid,
    required int societyid,
    required int superadminid,
    required int dynamicid,
    required String from,
    required String to,
    required String address,
  }) async {
    print(bearerToken);

    print(to);

    isLoading = true;
    update();

    String? type;
    if (user.structureType == 1) {
      type = 'society';
    } else {
      type = 'blocks';
    }

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addStreets));
    request.headers.addAll(headers);
    request.fields['from'] = from;

    request.fields['to'] = to;
    request.fields['address'] = address;

    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['superadminid'] = superadminid.toString();
    request.fields['dynamicid'] = dynamicid.toString();
    request.fields['type'] = type;

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      Get.snackbar("Streets Add Successfully", "");
      if (user.structureType == 1) {
        Get.offAndToNamed(streets, arguments: user);
        isLoading = false;
        update();
      } else if (user.structureType == 2) {
        Get.offAndToNamed(streets, arguments: [user, blockid]);
        isLoading = false;
        update();
      } else if (user.structureType == 3) {
        Get.offAndToNamed(streets, arguments: [user, blockid, phaseid]);
        isLoading = false;
        update();
      }
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
      Get.snackbar("Failed to Add Streets", "");
      isLoading = false;
      update();
    }
  }
}
