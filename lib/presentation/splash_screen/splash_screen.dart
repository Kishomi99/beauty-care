import 'package:BeautyCare/core/constants/image_constant.dart';
import 'package:BeautyCare/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            ImageConstant.logo,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
