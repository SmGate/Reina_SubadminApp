import 'package:get/get.dart';

class ViewImageController extends GetxController
{
  var data=Get.arguments;
  late final String? tag;
  late final String? img;


  @override
  void onInit() {
   
    super.onInit();
    tag=data[0];
    img=data[1];
  }






}