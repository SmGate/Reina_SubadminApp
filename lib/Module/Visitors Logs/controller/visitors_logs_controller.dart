import 'package:get/get.dart';

import '../../../Model/User.dart';
import '../model/visitors_logs_model.dart';
import '../service/visitors_logs_service.dart';

class VisitorsLogsController extends GetxController {
  var user = Get.arguments;
  late final User userdata;

  var visitorsLogsModel = VisitorsLogsModel();
  RxString error = "".obs;

  @override
  void onInit() {
    userdata = user;
    super.onInit();
  }

  Future<VisitorsLogsModel> getVisitorsLogs({
    String? societyId,
  }) async {
    error.value = "";

    var res = await VisitorsLogsService.getVisitorsLogs(societyId: societyId);
    if (res is VisitorsLogsModel) {
      visitorsLogsModel = res;

      return visitorsLogsModel;
    } else {
      error.value = res.toString();
      Get.snackbar("Error", error.value);
    }

    return visitorsLogsModel;
  }
}
