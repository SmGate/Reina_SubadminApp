import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';

class AddHousesController extends GetxController {
  var data = Get.arguments;
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
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

// int? sid;
// int? bid;
// int? pid;
  bool isLoading = false;
// String? bearerToken;

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final addressController = TextEditingController();
  int? streetid;
  int? blockid;
  int? phaseid;

  @override
  void onInit() {
  

    super.onInit();

    // sid = data[0];
    // bid = data[1];
    // pid = data[2];
    // bearerToken = data[3];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      super.onInit();

      user = await MySharedPreferences.getUserData();
      if (user.structureType == 5) {
        user = data;
      } else if (user.structureType == 1) {
        user = data[0];
        streetid = data[1];
      } else if (user.structureType == 2) {
        user = data[0];
        streetid = data[1];
        blockid = data[2];
      } else if (user.structureType == 3) {
        user = data[0];
        streetid = data[1];
        blockid = data[2];
        phaseid = data[3];
      }

      update();
    });
  }

  addHousesApi({
    required String bearerToken,
    required int dynamicid,
    required int subadminid,
    required int superadminid,
    required int societyid,
    required String from,
    required String to,
    required String address,
  }) async {
    print(bearerToken);

    print(from);
    print(to);

    isLoading = true;

    update();
    String type;
    if (user.structureType == 5) {
      type = 'society';
    } else {
      type = 'street';
    }

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addProperties));
    request.headers.addAll(headers);
    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['address'] = address;

    request.fields['dynamicid'] = dynamicid.toString();
    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();

    request.fields['superadminid'] = superadminid.toString();
    request.fields['type'] = type;

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      if (user.structureType == 5) {
        Get.offNamed(houses, arguments: user);
      } else if (user.structureType == 1) {
        Get.offNamed(houses, arguments: [user, streetid]);

        isLoading = false;

        update();
      } else if (user.structureType == 2) {
        Get.offNamed(houses, arguments: [user, streetid, blockid]);
        isLoading = false;

        update();
      } else if (user.structureType == 3) {
        Get.offNamed(houses, arguments: [user, streetid, blockid, phaseid]);
        isLoading = false;

        update();
      }

      Get.snackbar("Houses Add Successfully", "");
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
      Get.snackbar("Failed to Add Houses", "");
      isLoading = false;
      update();
    }
  }
}
