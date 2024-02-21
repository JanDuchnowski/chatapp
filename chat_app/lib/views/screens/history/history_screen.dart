import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Search History')),
        body: ListView(
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
      child: ListTile(
        leading: Image.network(imageUrl),
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
    );
  }
}
