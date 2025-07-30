import 'package:beauty_care/core/utils/pref_utils.dart';
import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  List<BeautyStore>? wishlistitem = [];

  RxList<BeautyStore> wishList = <BeautyStore>[].obs;

  List<BeautyStore> stores = [
    BeautyStore(
      id: "1",
      name: "Beauty Salon A",
      location: "Location A",
      distanceKm: 1.2,
      imagePath: "assets/images/1.jpg",
    ),
    BeautyStore(
      id: "2",
      name: "Beauty Salon B",
      location: "Location B",
      distanceKm: 2.5,
      imagePath: "assets/images/2.jpg",
    ),
    BeautyStore(
      id: "3",
      name: "Beauty Salon C",
      location: "Location C",
      distanceKm: 3.0,
      imagePath: "assets/images/3.jpg",
    ),
  ];

  void loadWishlistFromPrefs() {
    final storedIds = PrefUtils.getWishlistIds();
    print("Stored IDs: $storedIds");
    final matchedStores =
        stores.where((s) => storedIds.contains(s.id)).toList();
    wishList.value = matchedStores;
  }
}
