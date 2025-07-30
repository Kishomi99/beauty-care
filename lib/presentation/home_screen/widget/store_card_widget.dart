import 'package:beauty_care/core/constants/app_colors.dart';
import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:flutter/material.dart';

class BeautyStoreCard extends StatelessWidget {
  final BeautyStore store;

  const BeautyStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background Image
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              store.imagePath,
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
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.pink),
                onPressed: () {
                  // Save or toggle favorite
                },
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
                color: const Color.fromARGB(115, 119, 110, 110),
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
                          store.name,
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
                          onPressed: () {},
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
