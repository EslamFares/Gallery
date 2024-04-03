import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle font22BlueW400 = TextStyle(
    fontSize: 22,
    color: AppColors.blue,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font16DarkW500 = TextStyle(
    fontSize: 16,
    color: AppColors.dark,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle font40DarkW900 = TextStyle(
    fontSize: 40,
    color: Color(0xff4A4A4A),
    fontWeight: FontWeight.w900,
  );
  static const TextStyle font25BlackBold = TextStyle(
      fontSize: 25,
      color: AppColors.dark,
      fontWeight: FontWeight.bold,
      fontFamily: "BalooThambi2");
  static const TextStyle font32BlackBold = TextStyle(
      fontSize: 25,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "BalooThambi2");
}
