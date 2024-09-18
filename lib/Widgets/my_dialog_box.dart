import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/utils/style/colors/app_colors.dart';
import 'my_button.dart';

class CustomDialog extends StatelessWidget {
  final String? title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback? positiveBtnPressed;
  final GestureTapCallback? negativeBtnPressed;
  final Widget? image;

  CustomDialog({
    this.image,
    this.title,
    this.content,
    this.positiveBtnText,
    this.negativeBtnText,
    this.positiveBtnPressed,
    this.negativeBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 2,

          margin:
              EdgeInsets.only(top: 24), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(
              top: 60, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: GoogleFonts.montserrat(
                    color: AppColors.appThem, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                content!,
                style: GoogleFonts.montserrat(
                    color: HexColor('#4D4D4D'), fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    textColor: AppColors.globalWhite,
                    width: 100,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 40,
                    name: positiveBtnText!,
                    color: AppColors.appThem,
                    elevation: 0,
                    onPressed: positiveBtnPressed,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MyButton(
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    width: 100,
                    height: 40,
                    fontSize: 10,
                    name: negativeBtnText!,
                    color: HexColor('#E8E8E8'),
                    elevation: 0,
                    onPressed: negativeBtnPressed,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.appThem,
          // Top Circle with icon
          maxRadius: 30.0,
          child: image,
        ),
      ],
    );
  }
}
