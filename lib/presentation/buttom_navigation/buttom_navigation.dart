import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/presentation/buttom_navigation/controller/buttom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends GetWidget<BottomNavigationController> {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

              backgroundColor: const Color.fromARGB(255, 164, 158, 158),

              //height: 60,
              selectedIndex: controller.currentIndex.value,
              onDestinationSelected: (index) {
                controller.changeIndex(index);
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home, size: 24),
                  label: 'home'.tr,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.favorite_border, size: 24),
                  label: 'wishlist'.tr,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person, size: 24),
                  label: 'profile'.tr,
                ),
              ],
              indicatorColor: AppColors.accentGold,

              //  selectedItemColor: AppColors.goldGlow,
              //unselectedItemColor: AppColors.lightBg,
            ),
          ),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
    );
  }
}
