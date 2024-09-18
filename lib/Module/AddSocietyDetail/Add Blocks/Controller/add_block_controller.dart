import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';

class AddBlockController extends GetxController {
  var data = Get.arguments;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool isLoading = false;
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

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final addressController = TextEditingController();
  int? phaseid;

  @override
  void onInit() {
   

    super.onInit();

    // pid = data[0];
    // bearerToken = data[1];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      super.onInit();

      user = await MySharedPreferences.getUserData();

      if (user.structureType == 2) {
        user = data;
      } else {
        user = data[0];
        phaseid = data[1];
      }

      update();
    });
  }

  addBlocksApi({
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

    print(from);
    print(to);

    isLoading = true;
    update();
    String? type;
    if (user.structureType == 2) {
      type = 'society';
    } else if (user.structureType == 3) {
      type = 'phase';
    }

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addBlocks));
    request.headers.addAll(headers);
    request.fields['from'] = from;

    request.fields['to'] = to;
    request.fields['address'] = address;

    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['superadminid'] = superadminid.toString();
    request.fields['dynamicid'] = dynamicid.toString();
    request.fields['type'] = type!;

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Blocks Add Successfully", "");
      if (user.structureType == 2) {
        Get.offNamed(blocks, arguments: user);
        isLoading = false;
        update();
      } else {
        Get.offNamed(blocks, arguments: [user, phaseid]);
        isLoading = false;
        update();
      }
    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
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
      Get.snackbar("Failed to Add Blocks", "");
      isLoading = false;
      update();
    }
  }
}
