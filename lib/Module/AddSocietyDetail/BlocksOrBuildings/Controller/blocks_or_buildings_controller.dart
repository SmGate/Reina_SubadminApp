import 'package:get/get.dart';

class BlockOrBuildingController extends GetxController {
  var data = Get.arguments;

  int? pid;
  String? bearerToken;

  @override
  void onInit() {
  

    super.onInit();

    pid = data[0];
    bearerToken = data[1];
  }
}
