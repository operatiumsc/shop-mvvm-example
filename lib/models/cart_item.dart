import 'product.dart';

class CartItem {
  bool isSelected;
  Product product;
  int quantity;
  double totalAmount;

  CartItem({
    required this.isSelected,
    required this.product,
    required this.quantity,
    required this.totalAmount,
  });
}
