import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/utils/Constants/constants.dart';
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Model/User.dart';
import '../../../utils/Constants/api_routes.dart';
import '../../GateKepeer/Model/gate_keeper_model.dart';

class UpdateGateKeeperController extends GetxController {
  var argument = Get.arguments;
  late final Gatekeeper gatekeeper;
  late final User user;
  var isLoading = false;

  @override
  void onInit() {
    
    super.onInit();
    gatekeeper = argument[0];
    user = argument[1];

    fnameController.text = gatekeeper.firstName!;
    lnameController.text = gatekeeper.lastName!;
    gatenoController.text = gatekeeper.gateno!;
    mobilenoController.text = gatekeeper.mobileno!;
    addressController.text = gatekeeper.address!;
  }

  String? token;
  var file;
  var isFile = false;
  final formKey = new GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gatenoController = TextEditingController();
  File? imageFile;

  getFromGallery(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  getFromCamera(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future updateGatekeeperApi({
    required int gatekeeperid,
    required String gatekeeperfirstname,
    required String gatekeeperlastname,
    required String gatekeepergateno,
    required String gatekeepermobileno,
    required String gatekeeperaddress,
    required File? image,
    required String bearerToken,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.updateGatekeeper));
    request.headers.addAll(headers);
    if (image != null) {
      request.files.add(await Http.MultipartFile.fromPath('image', image.path));
    }
    request.fields['firstname'] = gatekeeperfirstname;
    request.fields['lastname'] = gatekeeperlastname;

    request.fields['address'] = gatekeeperaddress;
    request.fields['mobileno'] = gatekeepermobileno;
    request.fields['gateno'] = gatekeepergateno;

    request.fields['id'] = gatekeeperid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.body);
    if (response.statusCode == 200) {
      isLoading = false;
      update();

      Get.offAndToNamed(gatekeeperscreen, arguments: user);
      
    } else {


      myToast(msg: 'Failed to Update');
    }
  }
}
