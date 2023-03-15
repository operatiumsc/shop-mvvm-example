import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mvvm_example/view_models/product_view_model.dart';

import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context, listen: false);
    viewModel.fetchProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Example shop'),
      ),
      body: FutureBuilder<List<Product>>(
        future: viewModel.futureProducts,
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
                );
              },
              itemCount: products.length,
            );
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
