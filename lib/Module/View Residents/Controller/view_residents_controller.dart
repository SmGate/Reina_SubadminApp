import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../utils/Constants/api_routes.dart';
import '../../../utils/Constants/constants.dart';
import '../../../Model/User.dart';
import '../../../Widgets/my_button.dart';

import '../Model/Resident.dart';

class ViewResidentController extends GetxController {
  var user = Get.arguments;

  late final User userdata;
  var residentid = 0.obs;
  var token = "".obs;
  @override
  void onInit() {
    super.onInit();
    print("init");
    userdata = this.user;
  }

  viewResidentsApi(int subAdminId, String token) async {
    print(subAdminId.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewResidents + "/" + subAdminId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
// Residents.fromJson(data);
      final List<Resident> li = await (data['data'] as List)
          .map(
            (e) => Resident(
                firstname: e['firstname'],
                image: e['image'],
                password: e['password'],
                id: e['id'],
                address: e['address'],
                committeemember: e["committeemember"],
                cnic: e['cnic'],
                lastname: e['lastname'],
                mobileno: e['mobileno'],
                owneraddress: e['owneraddress'],
                ownermobileno: e['ownermobileno'],
                ownername: e['ownername'],
                //
                propertytype: e['propertytype'],
                residentid: e['residentid'],
                residenttype: e['residenttype'],
                roleid: e['roleid'],
                rolename: e['rolename'],
                subadminid: e['subadminid'],
                vechileno: e['vechileno'],
                created_at: e['created_at'],
                updated_at: e['updated_at']),
          )
          .toList();

      return li;
    }
  }

  searchResidentsApi(int subadminiid, String token, String query) async {
    print("Search Resident Api Hits");
    print(subadminiid.toString());
    print(token);
    print(query);

    final response = await Http.get(
      Uri.parse(Api.searchResidents +
          "/" +
          subadminiid.toString() +
          "/" +
          query.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
// Residents.fromJson(data);
      final List<Resident> li = await (data['residentslist'] as List)
          .map(
            (e) => Resident(
                firstname: e['firstname'],
                image: e['image'],
                password: e['password'],
                id: e['id'],
                address: e['address'],
                committeemember: e["committeemember"],
                cnic: e['cnic'],
                lastname: e['lastname'],
                mobileno: e['mobileno'],
                owneraddress: e['owneraddress'],
                ownermobileno: e['ownermobileno'],
                ownername: e['ownername'],
                //
                propertytype: e['propertytype'],
                residentid: e['residentid'],
                residenttype: e['residenttype'],
                roleid: e['roleid'],
                rolename: e['rolename'],
                subadminid: e['subadminid'],
                vechileno: e['vechileno'],
                created_at: e['created_at'],
                updated_at: e['updated_at']),
          )
          .toList();

      return li;
    }
  }

  DeleteResidentsApi(int residentid, String token) async {
    print(residentid);
    print(token);

    final response = await Http.get(
      Uri.parse(Api.deleteResident + "/" + residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      print(mydata);

      Get.toNamed(viewuser, arguments: user);

      update();
    } else {}
  }

  Future<void> showDeleteDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this Admin?'),
              actions: <Widget>[
                MyButton(
                  onPressed: () async {
                    await DeleteResidentsApi(residentid.value, token.value);
                  },
                  name: 'delete',
                  color: primaryColor,
                  maxLines: 1,
                ),
                MyButton(
                  onPressed: () {
                    Get.back();
                  },
                  maxLines: 1,
                  name: 'cancel',
                  textColor: Colors.white60,
                  color: primaryColor,
                ),
              ],
            ));
  }
}
