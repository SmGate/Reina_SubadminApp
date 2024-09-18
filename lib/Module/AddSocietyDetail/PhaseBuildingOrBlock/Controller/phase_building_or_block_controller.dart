
import 'package:get/get.dart';
import '../../../../Model/User.dart';

class PhaseBuildingOrBlockController extends GetxController {
  var data = Get.arguments;

  late final User user;
  int? pid;

  @override
  void onInit() {
 
    super.onInit();

    user = data[0];
    pid = data[1];
    
  }
}
