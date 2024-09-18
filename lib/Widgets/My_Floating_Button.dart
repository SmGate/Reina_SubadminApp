import 'package:flutter/material.dart';
import 'package:societyadminapp/Widgets/app_gradient.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';

// ignore: must_be_immutable
class MyFloatingButton extends StatelessWidget {
  MyFloatingButton({required this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppGradients.floatingbuttonGradient,
          shape: BoxShape.circle),
      child: IconButton(
          iconSize: 45,
          icon: Icon(
            Icons.add,
            color: AppColors.globalWhite,
          ),
          onPressed: onPressed),
    );
  }
}
