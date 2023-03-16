import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/cart_view_model.dart';
import '../views/cart_screen.dart';

class BadgedCartButton extends StatelessWidget {
  const BadgedCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: const BoxConstraints(
              minWidth: 16.0,
              minHeight: 16.0,
            ),
            child: Consumer<CartViewModel>(
              builder: (context, cartViewModel, __) {
                return Text(
                  '${cartViewModel.cartItems.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
