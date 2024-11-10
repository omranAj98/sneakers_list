import 'package:equatable/equatable.dart';
import 'sneaker.dart';

class CartItem extends Equatable {
  final Sneaker sneaker;
  final int quantity;

  CartItem({required this.sneaker, required this.quantity});

  CartItem copyWith({Sneaker? sneaker, int? quantity}) {
    return CartItem(
      sneaker: sneaker ?? this.sneaker,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [sneaker, quantity];
}