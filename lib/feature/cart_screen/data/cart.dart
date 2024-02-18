import 'package:demo_blog/feature/product_screen/data/product.dart';

class Cart {
  final List<Product> items;

  Cart({required this.items});

  double get totalPrice {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}
