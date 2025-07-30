import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const String fontFamily = 'Poppins';

  static const TextStyle buttonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    color: Colors.white,
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
    color: Colors.grey,
  );

  static const TextStyle labelFormText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: Colors.black,
  );

  static const TextStyle textButtonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: AppColors.accentGold,
  );

  static const TextStyle viewText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: AppColors.textColor,
  );
}
