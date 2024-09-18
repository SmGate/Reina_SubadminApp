
import 'package:get/get.dart';
import '../../../../Model/User.dart';


class LocalBuildingController extends GetxController {
  var data = Get.arguments;

  late final User user;
  int? pid;

  @override
  void onInit() {
   

    super.onInit();

    user = data;
    
    
  }
}
