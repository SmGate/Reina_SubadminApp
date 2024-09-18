import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

class CircularIndicatorUnderWhiteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.appThem),
          strokeWidth: 6.0,
        ),
        Positioned(
            child: Container(
                width: 100,
                height: 100,
                child: Card(
                  color: AppColors.globalWhite,
                  surfaceTintColor: AppColors.globalWhite,
                  elevation: 10,
                  child: LoadingAnimationWidget.hexagonDots(
                      color: AppColors.appThem, size: 40),
                )))
      ],
    );
  }
}
