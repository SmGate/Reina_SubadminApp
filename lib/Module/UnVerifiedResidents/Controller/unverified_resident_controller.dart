import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/ApartmentResidentModel.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/HouseResident.dart';
import '../../../utils/Constants/api_routes.dart';
import '../../../../Model/User.dart';

import '../Model/Resident Model/LocalBuildingApartmentResidentModel.dart';

class UnVerifiedResidentController extends GetxController {
  var user = Get.arguments;
  late final User userdata;
  Map<int, List<dynamic>> cache = {};

  @override
  void onInit() {
    super.onInit();
    userdata = this.user;
  }

  Future<HouseResident> viewUnVerifiedResidentApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedHouseResident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    print(
      Uri.parse(Api.unverifiedHouseResident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return HouseResident.fromJson(data);
    }

    return HouseResident.fromJson(data);
  }

  Future<ApartmentResidentModel> viewUnVerifiedApartmentResidentApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedApartmentResident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ApartmentResidentModel.fromJson(data);
    }

    return ApartmentResidentModel.fromJson(data);
  }

  Future<LocalBuildingApartmentResidentModel>
      viewUnVerifiedLocalBuildingApartmentResidentApi(
          {required int subadminid,
          required String token,
          required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedLocalBuildingApartmentResident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return LocalBuildingApartmentResidentModel.fromJson(data);
    }

    return LocalBuildingApartmentResidentModel.fromJson(data);
  }

  List<dynamic>? getCachedUnverifiedResidentData(
      int subadminid, String token, int tabIndex) {
    final cacheKey = _generateCacheKey(subadminid, token, tabIndex);
    return cache[cacheKey];
  }

  void cacheUnverifiedResidentData(List<dynamic> data, int tabIndex) {
    final cacheKey =
        _generateCacheKey(userdata.userid!, userdata.bearerToken!, tabIndex);
    cache[cacheKey] = data;
  }

  int _generateCacheKey(int subadminid, String token, int tabIndex) {
    final key = '$subadminid-$token-$tabIndex';
    return key.hashCode;
  }
}
