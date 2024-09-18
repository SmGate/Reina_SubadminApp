import 'dart:convert';

import 'package:get/get.dart';

import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import 'package:http/http.dart' as Http;

import '../Model/ReportedResident.dart';

class ResidentsListController extends GetxController {
  var user = Get.arguments;

  late final User userdata;

  List<ReportedResident> li = [];
  var currentGateKeeperId;
  var currentToekn;

  @override
  void onInit() {
    
    super.onInit();
    userdata = this.user;
    print("init ${userdata.userid!}");
    

    viewResidentsApi(userdata.userid!, userdata.bearerToken!);
  }

  Future<List<ReportedResident>> viewResidentsApi(
      int subadminid, String token) async {
    print("subadminiid.toString() ${subadminid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.reportedResidents + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      li = (data['data'] as List)
          .map((e) => ReportedResident(
                firstname: e['firstname'],
                lastname: e['lastname'],
                image: e['image'],
                id: e['id'],
                address: e['address'],
                cnic: e['cnic'],
                mobileno: e['mobileno'],
                roleid: e['roleid'],
                rolename: e['rolename'],
                subadminid: e['subadminid'],
                userid: e['userid'],
                title: e['title'],
                description: e['description'],
                date: e['date'],
                status: e['status'],
                statusdescription: e['statusdescription'],
              ))
          .toList();

      return li;
    }
    return li;
  }
}
