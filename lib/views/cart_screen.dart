import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body:
          Consumer<CartViewModel>(builder: (context, cartViewModel, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final cartItem = cartViewModel.cartItems[index];
            return CheckboxListTile(
              title: Text('${cartItem.product.title}'),
              subtitle: Text(
                  'Price: ${cartItem.product.price}\nQuantity: ${cartItem.quantity}\nAmount:${cartItem.totalAmount}'),
              value: cartItem.isSelected,
              onChanged: (value) {
                cartViewModel.checkCartItem(value, index);
              },
            );
          },
          itemCount: cartViewModel.cartItems.length,
        );
      }),
    );
  }
}
