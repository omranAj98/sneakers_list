import 'package:get/get.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/sneaker.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  double get totalPrice => cartItems.fold(
        0,
        (sum, item) => sum + (item.sneaker.price * item.quantity),
      );

  void addToCart(Sneaker sneaker) {
    int index = cartItems.indexWhere((item) => item.sneaker == sneaker);
    if (index >= 0) {
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity + 1,
      );
    } else {
      cartItems.add(CartItem(sneaker: sneaker, quantity: 1));
    }
  }

  void removeFromCart(Sneaker sneaker) {
    cartItems.removeWhere((item) => item.sneaker == sneaker);
  }

  void updateQuantity(Sneaker sneaker, int quantity) {
    int index = cartItems.indexWhere((item) => item.sneaker == sneaker);
    if (index >= 0) {
      if (quantity > 0) {
        cartItems[index] = cartItems[index].copyWith(quantity: quantity);
      } else {
        removeFromCart(sneaker);
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
