import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  ProfileController get profileController => Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.goldGlow,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.goldGlow.withOpacity(0.7),
                              offset: const Offset(40, 0),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        "profile".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      profileController.logout();
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
