class RestaurantModel {
  final String name;
  final String imageUrl;
  final String rating;
  final String description;
  final String category;
  final String location;

  RestaurantModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.category,
    required this.location,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      imageUrl: json['image_url'],
      rating: json['rating'],
      description: json['description'],
      category: json['category'],
      location: json['location'],
    );
  }
}
