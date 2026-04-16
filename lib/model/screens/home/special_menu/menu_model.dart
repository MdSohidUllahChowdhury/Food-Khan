import 'dart:ui';

class MenuInfo {
  final String id;
  final String name;
  final String imageUrl;
  final String price;
  final String? rating;
  final String? discount;
  final String? category;
  final Color? background_color;
  final int quantity;

  MenuInfo({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.discount,
    this.category,
    this.background_color,
    this.rating,
    this.quantity = 1,
  });

  factory MenuInfo.fromJson(Map<String, dynamic> json) {
    return MenuInfo(
      id: json['id'].toString(),
      name: json['name'].toString(),
      imageUrl: json['image_url'].toString(),
      price: json['price'].toString(),
      rating: _asNullableString(json['rating']),
      discount: _asNullableString(json['discount']),
      category: _asNullableString(json['category']),
      background_color: _parseColor(json['background_color']),
    );
  }

  factory MenuInfo.fromCartJson(Map<String, dynamic> json) {
    return MenuInfo(
      id: json['menu_id'].toString(),
      name: json['name'].toString(),
      imageUrl: json['image_url'].toString(),
      price: json['price'].toString(),
      rating: _asNullableString(json['rating']),
      discount: _asNullableString(json['discount']),
      category: _asNullableString(json['category']),
      background_color: _parseColor(json['background_color']),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );
  }

  Map<String, dynamic> toCartJson({
    required String userId,
    required String? userEmail,
    int? quantity,
  }) {
    return {
      'user_id': userId,
      'user_email': userEmail,
      'menu_id': id,
      'name': name,
      'image_url': imageUrl,
      'price': price,
      'rating': rating,
      'discount': discount,
      'category': category,
      'background_color': _toHexColor(background_color),
      'quantity': quantity ?? this.quantity,
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  static String? _asNullableString(dynamic value) {
    if (value == null) {
      return null;
    }

    final text = value.toString();
    return text.isEmpty ? null : text;
  }

  static Color? _parseColor(dynamic value) {
    if (value == null) {
      return null;
    }

    final colorText = value.toString().replaceFirst('#', '');
    if (colorText.length != 6) {
      return null;
    }

    return Color(int.parse(colorText, radix: 16) + 0xFF000000);
  }

  static String? _toHexColor(Color? color) {
    if (color == null) {
      return null;
    }

    final colorValue = color.value.toRadixString(16).padLeft(8, '0');
    return '#${colorValue.substring(2)}';
  }

  MenuInfo copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? price,
    String? rating,
    String? discount,
    String? category,
    Color? background_color,
    int? quantity,
  }) {
    return MenuInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      background_color: background_color ?? this.background_color,
      quantity: quantity ?? this.quantity,
    );
  }
}
