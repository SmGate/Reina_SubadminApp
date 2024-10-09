import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:societyadminapp/Module/Chat%20Moderator/model/blocked_residents_model.dart';
import 'package:societyadminapp/Module/Chat%20Moderator/services/moderation_service.dart';

import '../../../Model/User.dart';

class BlockedUserController extends GetxController {
  var user = Get.arguments;
  late final User userdata;

  ////////// getting blocked residents in chat
  RxString errorgettingBlockedUser = "".obs;
  var blockedUserModel = BlockedResidentsModel();
  List<Datum> blockedUserList = [];
  final PagingController<int, Datum> pagingController =
      PagingController(firstPageKey: 1);
  RxString searchVal = "".obs;
  var pageSize = 10;

  void onInit() {
    super.onInit();
    print("init");
    userdata = this.user;

    pagingController.addPageRequestListener((pageKey) {
      print("*****************is THis method call");
      viewBlockedUser(
          pageKey: pageKey,
          limit: pageSize,
          societyId: userdata.societyid.toString());
    });
  }

  viewBlockedUser({
    String? societyId,
    int? pageKey,
    int? limit,
  }) async {
    print("this method is called");
    errorgettingBlockedUser.value = "";

    var res = await ModerationService.getAllBlockedUserList(
      societyId: societyId,
      pageKey: pageKey,
      limit: limit,
    );

    if (res is BlockedResidentsModel) {
      blockedUserModel = res;
      blockedUserList = blockedUserModel.data?.data ?? [];

      final isLastPage = blockedUserList.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(blockedUserList);
      } else {
        final nextPageKey = pageKey! + 1;
        pagingController.appendPage(blockedUserList, nextPageKey);
      }
    } else {
      errorgettingBlockedUser.value = res.toString();
      Get.snackbar("Error", errorgettingBlockedUser.value);
    }
  }
}
