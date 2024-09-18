import 'package:get/get.dart';

import '../../../Model/User.dart' as U;

class BillsController extends GetxController {
  var userdata = Get.arguments;
  late final U.User user;

  @override
  void onInit() {
    super.onInit();
    user = this.userdata;
  }
}
