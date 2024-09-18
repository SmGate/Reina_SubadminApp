import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../../Model/User.dart';


class BlockBuildingOrStreetController extends GetxController {
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

  int? bid;
  int? phaseid;

  @override
  void onInit() {
   

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      super.onInit();

      user = await MySharedPreferences.getUserData();
      if (user.structureType == 2) {
        user = data[0];
        bid = data[1];
      } else if (user.structureType == 3) {
        user = data[0];
        bid = data[1];
        phaseid = data[2];
      }

      update();
    });
  }
}
