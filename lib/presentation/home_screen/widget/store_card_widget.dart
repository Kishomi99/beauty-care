import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:beauty_care/presentation/home_screen/controller/home_controller.dart';
import 'package:beauty_care/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BeautyStoreCard extends StatelessWidget {
  final BeautyStore store;
  HomeController homeController = Get.find<HomeController>();

  BeautyStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background Image
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              store.imagePath!,
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),

          // Heart Icon
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Obx(
                () => IconButton(
                  icon: homeController.isFavorite.value == true
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border, color: Colors.grey),
                  onPressed: () {
                    if (homeController.isFavorite.value == true) {
                      homeController.isFavorite.value = false;
                      homeController.removeItem(store);
                    } else {
                      homeController.isFavorite.value = true;
                      homeController.addItem(store);
                    }
                  },
                ),
              ),
            ),
          ),

          // Name, Location, Button
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backBlur,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name and location
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${store.location} • ${store.distanceKm} km",
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),

                    // View button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.goldGlow,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            // Navigate to details screen
                            Get.toNamed(AppRoute.storeViewScreen,
                                arguments: store);
                          },
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.black, size: 30)),
                    ),
                    /*  ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to details screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldGlow,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("View"),
                    ),
                  */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
