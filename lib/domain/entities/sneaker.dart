import 'package:sneakers_list/data/models/sneaker_model.dart';

class Sneaker {
  final List<String> images;
  final String name;
  final String brand;
  final double price;
  final String description;
  final String color;

  Sneaker({
    required this.images,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.color,
  });
}
extension SneakerModelX on SneakerModel {
  Sneaker toEntity() {
    return Sneaker(
      images: images,
      name: name,
      brand: brand,
      price: price,
      description: description,
      color: color,
    );
  }
}