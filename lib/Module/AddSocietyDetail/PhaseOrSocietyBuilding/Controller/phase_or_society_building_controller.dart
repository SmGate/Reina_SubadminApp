import 'package:get/get.dart';
import '../../../../Model/User.dart';

class PhaseOrSocietyBuildingController extends GetxController {
  var data = Get.arguments;

  late final User user;

  @override
  void onInit() {
    

    super.onInit();

    user = data;
  }
}
