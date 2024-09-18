import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/utils/Constants/constants.dart';

import '../../../utils/Constants/api_routes.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  var isHidden = false;
  var isLoading = false;
  final formKey = new GlobalKey<FormState>();

  Future resetPasswordApi({
    required int gateKeeperId,
    required String bearerToken,
    required String password,
  }) async {
    isLoading = true;
    update();
    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.resetPassword));
    request.headers.addAll(headers);

    request.fields['password'] = password;
    request.fields['id'] = gateKeeperId.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body.toString());
      passwordController.clear();
      Get.back();

      myToast(msg: '${data['message'].toString()}');
      isLoading = false;
      update();
    } else if (response.statusCode == 403) {
      myToast(msg: 'Error ${response.body.toString()}');

      isLoading = false;
      update();
    } else if (response.statusCode == 500) {
      myToast(msg: 'Server Error');

      isLoading = false;
      update();
    } else {
      myToast(msg: 'Something Went Wrong');
      isLoading = false;
      update();
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
