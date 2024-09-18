import 'package:get/get.dart';

import '../../../Model/User.dart';


class ProfileController extends GetxController
{

  var userdata= Get.arguments;
  late final User user;


@override
  void onInit() {
 
    super.onInit();

    this.user=userdata;


    print(user.firstName);
    print(user.image);
    print(user.address);
  }



}