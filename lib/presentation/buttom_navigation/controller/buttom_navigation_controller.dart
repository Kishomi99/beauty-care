import 'package:beauty_care/presentation/home_screen/home_screen.dart';
import 'package:beauty_care/presentation/profile_screen/profile_screen.dart';
import 'package:beauty_care/presentation/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    WishListScreen(),
    ProfileScreen(),
    // Add your page widgets here
    // Example: HomePage(), WishlistPage(), ProfilePage()
  ];
}
