import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/gate_keeper_model.dart';

class GateKeeperController extends GetxController {
  var userdata = Get.arguments;
  late final User user;
  List<Gatekeeper> li = [];

  @override
  void onInit() {
   
    super.onInit();

    user = userdata;
  }

  Future<List<Gatekeeper>> viewGatekeepersApi(
      int gatekeeperid, String token) async {
    print("subadminiid.toString() ${gatekeeperid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewGatekeepers + "/" + gatekeeperid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      li = (data['gatekeeperlist'] as List)
          .map((e) => Gatekeeper(
                gatekeeperid: e['gatekeeperid'],
                firstName: e['firstname'],
                image: e['image'],
                password: e['password'],
                id: e['id'],
                address: e['address'],
                gateno: e['gateno'],
                cnic: e['cnic'],
                lastName: e['lastname'],
                mobileno: e['mobileno'],
                roleid: e['roleid'],
                rolename: e['rolename'],
                subadminid: e['subadminid'],
                societyid: e['societyid'],
              ))
          .toList();

      return li;
    }
    return li;
  }

  Future deleteGateKeeperApi(int gatekeeperid, String token) async {
    print(gatekeeperid.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.deleteGatekeeper + "/" + gatekeeperid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    print('my data.......$mydata');

    if (response.statusCode == 200) {
      //listOfSubAdmi.clear();

      viewGatekeepersApi(gatekeeperid, userdata.bearerToken!);

      Get.back();

      update();
    }
    update();
  }
}
