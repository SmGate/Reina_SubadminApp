// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:societyadminapp/utils/style/colors/app_colors.dart';

import '../../../utils/Constants/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.controller, required this.hintText});
  TextEditingController? controller;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: emptyStringValidator,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorStyle: GoogleFonts.ubuntu(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(color: AppColors.appThem, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(color: AppColors.appThem, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(color: AppColors.appThem, width: 1.5),
        ),
        fillColor: Colors.white10,
        filled: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 25.h, left: 12.w),
        hintText: hintText,
      ),
    );
  }
}
