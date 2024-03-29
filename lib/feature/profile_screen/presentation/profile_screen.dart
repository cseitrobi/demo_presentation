import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                'https://placehold.co/',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Polygon Tech',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'info@polygontech.xyz',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Divider(), // Horizontal line
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Banani,Dhaka'),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Software Engineer'),
            ),
          ],
        ),
      ),
    );
  }
}
