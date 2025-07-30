import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/core/constants/app_text_style.dart';
import 'package:beauty_care/widget/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'controller/store_view_controller.dart';

class StoreViewScreen extends GetWidget<StoreViewController> {
  const StoreViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.35,
                    width: double.infinity,
                    child: Image.asset(
                      controller.model.imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: AppColors.backBlur,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  // Store Name
                  Positioned(
                    bottom: 15,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backBlur,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Name and location
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.model.name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.white70,
                                    ),
                                    Text(
                                      "${controller.model.distanceKm} km",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: controller.model.isFavorite == true
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Color.fromARGB(255, 224, 220, 220),
                                    ),
                              onPressed: () {
                                controller.model.isFavorite =
                                    !controller.model.isFavorite!;
                                controller.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    contectBox(
                      icon: Icons.call,
                      label: "call".tr,
                      onTap: () => controller.launchCall('0763072575'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    contectBox(
                      icon: Icons.messenger_outline_outlined,
                      label: "message".tr,
                      onTap: () => controller.launchSMS('0763072575'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    contectBox(
                      icon: Icons.link_sharp,
                      label: "website".tr,
                      onTap: () =>
                          controller.openUrl('https://www.facebook.com'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    contectBox(
                      icon: Icons.facebook,
                      label: "facebook".tr,
                      onTap: () =>
                          controller.openUrl('https://www.facebook.com'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.darkBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: AppColors.textColor),
                            const SizedBox(width: 10),
                            Text(controller.model.location!,
                                style: AppTextStyle.viewText),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined,
                                color: AppColors.textColor),
                            const SizedBox(width: 10),
                            Text(controller.getDate(),
                                style: AppTextStyle.viewText),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                          onPressed: () => {},
                          text: "book_now".tr,
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.goldGlow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          buttonTextStyle: AppTextStyle.buttonText.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector contectBox({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.darkBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.textColor,
              size: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: AppTextStyle.viewText,
            )
          ],
        ),
      ),
    );
  }
}
