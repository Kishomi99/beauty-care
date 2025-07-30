class BeautyStore {
  String id;
  String? name;
  String? location;
  double? distanceKm;
  String? imagePath;
  bool? isFavorite;

  BeautyStore({
    required this.id,
    this.name,
    this.location,
    this.distanceKm,
    this.imagePath,
    this.isFavorite,
  });
}
