import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartViewModel extends ChangeNotifier {
  List<CartItem> cartItems = [];

  void addToCart(Product product) {
    bool itemFound = false;

    for (CartItem cartItem in cartItems) {
      if (cartItem.product == product) {
        cartItem.quantity++;
        itemFound = true;
        break;
      }
    }

    if (!itemFound) {
      cartItems.add(CartItem(
        isSelected: false,
        product: product,
        quantity: 1,
        totalAmount: product.price ?? 0,
      ));
    }

    notifyListeners();
  }

  void increaseQuantity(int index) {
    final cartItem = cartItems[index];

    cartItem.quantity++;
    cartItem.totalAmount = cartItem.quantity * (cartItem.product.price ?? 0);

    notifyListeners();
  }

  void decreaseQuantity(int index) {
    final cartItem = cartItems[index];

    cartItem.quantity--;
    cartItem.totalAmount = cartItem.quantity * (cartItem.product.price ?? 0);

    if (cartItems[index].quantity == 0) {
      cartItems.removeAt(index);
    }

    notifyListeners();
  }

  void checkCartItem(bool? value, int index) {
    cartItems[index].isSelected = value ?? false;

    notifyListeners();
  }

  void removeFromCart(index) {
    cartItems.removeAt(index);

    notifyListeners();
  }
}
