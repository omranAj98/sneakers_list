// lib/data/models/sneaker_model.dart
class SneakerModel {
  final List<String> images;
  final String name;
  final String brand;
  final double price;
  final String description;
  final String color;

  SneakerModel({
    required this.images,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.color,
  });

  factory SneakerModel.fromJson(Map<String, dynamic> json) {
    return SneakerModel(
      images: List<String>.from(json['images'] ?? []),
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      price: double.tryParse(json['price'] ?? '0') ?? 0.0,
      description: json['description'] ?? '',
      color: json['color'] ?? '',
    );
  }

  @override
  String toString() {
    return 'SneakerModel(images: $images, name: $name, brand: $brand, price: $price, description: $description, color: $color)';
  }
}

