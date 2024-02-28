import 'package:flutter/material.dart';
import 'package:untitled/Configurations/AppColors.dart';
import 'package:untitled/Configurations/AppFonts.dart';
class AppStyles {
  static boldText({Color? color, String? fontFamily, double? fontSize}) {
    return TextStyle(
      color: AppColors.darkTextColor,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      fontSize:20.0,
      fontWeight: FontWeight.w700,
    );
  }static boldnText({Color? color, String? fontFamily, double? fontSize}) {
    return TextStyle(
      color: AppColors.whiteColor,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      fontSize:20.0,
      fontWeight: FontWeight.w700,
    );
  }
  static semiboldText({Color? color, String? fontFamily, double? fontSize}) {
    return TextStyle(
      color: AppColors.textColor,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      fontSize:14.0,
      fontWeight: FontWeight.bold,
    );
  }
}