import 'package:flutter/material.dart';

import '../models/product.dart';
import '../repositories/product.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel(this.productRepository);

  final ProductRepository productRepository;

  Future<List<Product>>? futureProducts;

  Future<void> fetchProducts() async {
    futureProducts = productRepository.fetchProducts();
  }
}
