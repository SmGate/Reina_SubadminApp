import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart' as U;
import '../Model/BillModel.dart';

class GeneratedHouseBillController extends GetxController {
  var userdata = Get.arguments;

  late final U.User user;
  String? firstname;
  String? lastname;
  @override
  void onInit() {
   
    super.onInit();
    print("init");
    user = this.userdata;
  }

  generatedHouseBillApi(int subadminid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.generatedHouseBill + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    print(response.body.toString());
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      return BillModel.fromJson(data);
    }
    return BillModel.fromJson(data);
  }
}
