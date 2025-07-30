import 'package:beauty_care/data/models/beauty_store_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  BeautyStore? selectedStore;

  List<BeautyStore> stores = [
    BeautyStore(
        name: "Beauty Salon A",
        location: "Location A",
        distanceKm: 1.2,
        imagePath: "assets/images/1.jpg"),
    BeautyStore(
        name: "Beauty Salon B",
        location: "Location B",
        distanceKm: 2.5,
        imagePath: "assets/images/2.jpg"),
    BeautyStore(
        name: "Beauty Salon C",
        location: "Location C",
        distanceKm: 3.0,
        imagePath: "assets/images/3.jpg"),
  ];
}
