import 'package:shop_mvvm_example/utils/example/product_list.dart';

import '../models/product.dart';
import '../services/dio.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('/product');
    final data = List.from(response.data);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return mockProducts;
  }
}
