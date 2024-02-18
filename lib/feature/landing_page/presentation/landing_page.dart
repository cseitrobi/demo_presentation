import 'package:demo_blog/feature/cart_screen/presentation/cart_screen.dart';
import 'package:demo_blog/feature/dashboard/presentation/dashboard.dart';
import 'package:demo_blog/feature/product_screen/presentation/product_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  // Screens for bottom navigation bar
  final List<Widget> _screens = [
    DashboardScreen(),
    ProductScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            tooltip: 'Dashboard', // Tooltip for testing
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Product',
            tooltip: 'Product', // Tooltip for testing
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            tooltip: 'Cart', // Tooltip for testing
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile', // Tooltip for testing
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
