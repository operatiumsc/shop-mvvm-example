import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/product_view_model.dart';
import '../widgets/badged_cart_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);

    final cartItemViewModel =
        Provider.of<CartViewModel>(context, listen: false);

    productViewModel.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Example shop'),
        actions: const [
          BadgedCartButton(),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: productViewModel.futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Oops! some error occurs.'),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            
            return ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.title ?? 'Untitle'),
                  subtitle: Text('price: ${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      cartItemViewModel.addToCart(product);
                    },
                  ),
                );
              },
              itemCount: products.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
