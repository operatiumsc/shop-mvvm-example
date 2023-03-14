import 'package:flutter/material.dart';

import '../models/product.dart';
import '../repositories/product.dart';


class ProductListViewModel extends ChangeNotifier {
  Future<List<Product>>? futureProducts;
  List<Product> products = [];

  Future fetchProducts() async {
    final productRepository = ProductRepository();
    futureProducts = productRepository.fetchProducts();
    products = await futureProducts ?? [];
    notifyListeners();
  }
}
