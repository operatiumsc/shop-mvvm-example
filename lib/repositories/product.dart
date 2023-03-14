import '../models/product.dart';
import '../services/client.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('/product');
    final data = List.from(response.data);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
