import 'package:demo_blog/feature/cart_screen/data/cart.dart';
import 'package:demo_blog/feature/product_screen/data/product.dart';

class CartManager {
  static final Cart cart = Cart(items: []);

  static void addToCart(Product product) {
    cart.items.add(product);
  }

  static void removeFromCart(Product product) {
    cart.items.remove(product);
  }
}
