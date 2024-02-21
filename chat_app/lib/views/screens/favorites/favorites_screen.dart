import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Motor for traveling',
              'Powerful motor for long-distance travel',
            ),
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Snowboard for beginners',
              'Perfect for learning snowboarding',
            ),
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Snowboard for beginners',
              'Perfect for learning snowboarding',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(
    String imageUrl,
    String title,
    String subtitle,
  ) {
    return Card(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(imageUrl),
            Expanded(
              child: ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.ios_share,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
