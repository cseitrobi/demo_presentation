import 'package:demo_blog/feature/cart_screen/data/manage_cart.dart';
import 'package:demo_blog/feature/product_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
