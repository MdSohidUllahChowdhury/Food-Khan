import 'dart:ui';

class MenuInfo {
  final String id;
  final String name;
  final String imageUrl;
  final String rating;
  final String discount;
  final String category;
  final Color background_color;
  //final DateTime createdAt;

  MenuInfo({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.discount,
    required this.category,
    required this.background_color,
    //required this.createdAt,
  });

  factory MenuInfo.fromJson(Map<String, dynamic> json) {
    return MenuInfo(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      rating: json['rating'],
      discount: json['discount'],
      category: json['category'],
      background_color: Color(int.parse(json['background_color'].substring(1, 7), radix: 16) + 0xFF000000),
      //createdAt: DateTime.parse(json['created_at']),
    );
  }
}
