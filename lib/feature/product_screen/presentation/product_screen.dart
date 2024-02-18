import 'package:demo_blog/feature/cart_screen/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Product {
  final String title;
  final String brand;
  final double price;

  Product({required this.title, required this.brand, required this.price});
}

class ProductScreen extends StatelessWidget {
  final List<Product> products = List.generate(
    10,
    (index) => Product(
      title: 'Product ${index + 1}',
      brand: 'Brand ${(Random().nextDouble() * 100).floor()}',
      price: (Random().nextDouble() * 100).toDouble(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(
                '${product.brand} - BDT ${product.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                CartManager.addToCart(product);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CartScreen()),
                // );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item added to cart'),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}

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

class CartManager {
  static final Cart cart = Cart(items: []);

  static void addToCart(Product product) {
    cart.items.add(product);
  }

  static void removeFromCart(Product product) {
    cart.items.remove(product);
  }
}
