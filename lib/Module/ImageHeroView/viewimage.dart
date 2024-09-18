
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/ImageHeroView/Controller/viewimage_controller.dart';

class ViewImage extends GetView {
final ViewImageController viewImageController = Get.put(ViewImageController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        body: Hero(tag: viewImageController.tag!,
      child: Center(child:Image.network(viewImageController.img!)),


    ));
  }
}