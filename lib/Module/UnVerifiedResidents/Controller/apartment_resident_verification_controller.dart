import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident Model/ApartmentResidentModel.dart'
    as ApartmentResidentModel;

import '../../../../Model/User.dart';
import '../../../utils/Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../Model/Resident Model/ApartmentResidentModel.dart';

class ApartmentResidentVerificationController extends GetxController {
  var data = Get.arguments;
  late final User userdata;
  late ApartmentResidentModel.Data resident;
  bool loading = false;

  String country = '';
  String state = '';
  String city = '';
  String propertyType = 'House';
  String residentalType = 'Rental';
  Building? building;
  Floor? floor;
  Apartment? apartment;

  /* for apartments */
  var buildingli = <Building>[];
  var floorli = <Floor>[];
  var apartmentli = <Apartment>[];

  var housesApartments = <Measurement>[];
  Measurement? measurementModel;

  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController houseaddressdetailController = TextEditingController();

  SelectedHousesApartments(val) {
    measurementModel = val;

    update();
  }

  SelectedBuilding(val) async {
    apartmentli.clear();
    apartment = null;
    floor = null;
    floorli.clear();
    measurementModel = null;

    housesApartments.clear();
    houseaddressdetailController.clear();
    building = val;

    update();
  }

  SelectedFloor(val) async {
    apartmentli.clear();
    apartment = null;
    measurementModel = null;
    housesApartments.clear();
    houseaddressdetailController.clear();

    floor = val;

    update();
  }

  SelectedApartment(val) async {
    measurementModel = null;
    housesApartments.clear();

    apartment = val;

    update();
  }

  Future<List<Measurement>> housesApartmentsModelApi(
      {required int subadminid,
      required String token,
      required String type}) async {
    print(subadminid);
    print(token);
    print(type);

    var response = await Dio().get(
        Api.housesApartmentMeasurements +
            '/' +
            subadminid.toString() +
            '/' +
            type.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        }));
    var data = response.data['data'];

    housesApartments = (data as List)
        .map((e) => Measurement(
            id: e['id'],
            subadminid: e['subadminid'],
            charges: e['charges'],
            area: e['area'],
            bedrooms: e['bedrooms'],
            status: e['status'],
            type: e['type'],
            unit: e['unit']))
        .toList();

    return housesApartments;
  }

  Future<List<Building>> viewAllBuildingApi(
      {required subAdminId, required bearerToken}) async {
    var response = await Dio().get(
        Api.allSocietyBuildings + '/' + subAdminId.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    buildingli = (data as List)
        .map((e) => Building(
            id: e['id'],
            subadminid: e['pid'],
            societybuildingname: e['societybuildingname'],
            type: e['type'],
            societyid: e['societyid'],
            dynamicid: e['dynamicid'],
            superadminid: e['superadminid']))
        .toList();

    return buildingli;
  }

  Future<List<Floor>> viewAllFloorApi(
      {required buildingid, required bearerToken}) async {
    print(buildingid);
    var response = await Dio().get(
        Api.viewSocietyBuildingFloors + '/' + buildingid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    floorli = (data as List)
        .map((e) => Floor(
              id: e['id'],
              buildingid: e['pid'],
              name: e['name'],
            ))
        .toList();

    return floorli;
  }

  Future<List<Apartment>> viewAllApartmentApi(
      {required floorid, required bearerToken}) async {
    print(floorid);
    var response = await Dio().get(
        Api.viewSocietyBuildingApartments + '/' + floorid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    apartmentli = (data as List)
        .map((e) => Apartment(
              id: e['id'],
              name: e['name'],
              societybuildingfloorid: e['societybuildingfloorid'],
            ))
        .toList();

    return apartmentli;
  }

  @override
  void onInit() {
    super.onInit();

    userdata = data[0];
    resident = data[1];

    SelectedBuilding(Building(
        type: resident.building!.first.type,
        superadminid: resident.building!.first.superadminid,
        dynamicid: resident.building!.first.dynamicid,
        societyid: resident.building!.first.societyid,
        subadminid: resident.building!.first.subadminid,
        id: resident.building!.first.id,
        updatedAt: resident.building!.first.updatedAt,
        createdAt: resident.building!.first.createdAt,
        societybuildingname: resident.building!.first.societybuildingname));
    SelectedFloor(Floor(
        createdAt: resident.floor!.first.createdAt,
        updatedAt: resident.floor!.first.updatedAt,
        id: resident.floor!.first.id,
        name: resident.floor!.first.name,
        buildingid: resident.floor!.first.buildingid));
    SelectedApartment(Apartment(
        name: resident.apartment!.first.name,
        id: resident.apartment!.first.id,
        createdAt: resident.apartment!.first.createdAt,
        updatedAt: resident.apartment!.first.updatedAt,
        type: resident.apartment!.first.type,
        typeid: resident.apartment!.first.typeid,
        societybuildingfloorid:
            resident.apartment!.first.societybuildingfloorid));
    SelectedHousesApartments(Measurement(
        id: resident.measurement!.first.id,
        subadminid: resident.measurement!.first.subadminid,
        charges: resident.measurement!.first.charges,
        area: resident.measurement!.first.area,
        bedrooms: resident.measurement!.first.bedrooms,
        status: resident.measurement!.first.status,
        type: resident.measurement!.first.type,
        unit: resident.measurement!.first.unit));
    houseaddressdetailController.text = resident.houseaddress!.toString();
    vehiclenoController.text = resident.vechileno.toString();
  }

  Future verifyApartmentResidentApi({
    residentid,
    required int status,
    buildingid,
    societybuildingfloorid,
    societybuildingapartmentid,
    measurementid,
    vechileno,
    houseaddress,
    required String token,
  }) async {
    loading = true;
    update();
    final response = await Http.post(Uri.parse(Api.verifyApartmentResident),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "residentid": residentid,
          "status": status,
          'buildingid': buildingid,
          'societybuildingfloorid': societybuildingfloorid,
          'societybuildingapartmentid': societybuildingapartmentid,
          'measurementid': measurementid,
          "vechileno": vechileno,
          "houseaddress": houseaddress
        }));

    print(response.body);

    if (response.statusCode == 200) {
      Get.offNamed(unverifiedresident, arguments: userdata);

      loading = false;
      update();
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());
      var errors = data['errors'] as List;

      for (int i = 0; i < errors.length; i++) {
        Get.snackbar('Error', errors[i].toString());
        loading = false;
        update();
      }
    } else if (response.statusCode == 409) {
      var data = jsonDecode(response.body.toString());

      Get.snackbar(data['message'], "");
      loading = false;
      update();
    } else {
      Get.snackbar('Something went wrong.', "");
      loading = false;
      update();
    }
  }
}
