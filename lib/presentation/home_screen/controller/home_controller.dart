import 'package:beauty_care/core/utils/pref_utils.dart';
import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // RxList<BeautyStore> beautyStores = <BeautyStore>[].obs;

  RxList<BeautyStore> wishList = <BeautyStore>[].obs;

  RxBool isFavorite = false.obs;

  void addItem(BeautyStore item) {
    wishList.add(item);
    _saveWishlistToPrefs();
    print(item);
  }

  void searchStores() {
    // Implement search logic here
    print("Searching stores...");
  }

  void removeItem(BeautyStore item) {
    wishList.remove(item);
    removeWishlistId(item.id!);
    _saveWishlistToPrefs();
    print(item);
  }

  void _saveWishlistToPrefs() {
    var ids = wishList.map((e) => e.id).toList();
    PrefUtils.setWishlistIds(ids);
    print("Wishlist saved to preferences: $ids");
  }

  void removeWishlistId(String id) {
    wishList.removeWhere((item) => item.id == id);
    PrefUtils.removeWishId(id);
  }

  List<BeautyStore> stores = [
    BeautyStore(
      id: "1",
      name: "Beauty Salon A",
      location: "Location A",
      distanceKm: 1.2,
      imagePath: "assets/images/1.jpg",
      isFavorite: false,
    ),
    BeautyStore(
      id: "2",
      name: "Beauty Salon B",
      location: "Location B",
      distanceKm: 2.5,
      imagePath: "assets/images/2.jpg",
      isFavorite: false,
    ),
    BeautyStore(
      id: "3",
      name: "Beauty Salon C",
      location: "Location C",
      distanceKm: 3.0,
      imagePath: "assets/images/3.jpg",
      isFavorite: false,
    ),
  ];
}
