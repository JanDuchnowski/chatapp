import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/history/widgets/tripple_price_widget.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Motor for traveling',
              'Powerful motor for long-distance travel',
              ctxData,
            ),
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Snowboard for beginners',
              'Perfect for learning snowboarding',
              ctxData,
            ),
            buildCard(
              'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
              'Snowboard for beginners',
              'Perfect for learning snowboarding',
              ctxData,
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
    BuildContextData ctxData,
  ) {
    return Card(
      color: Colors.white,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: ctxData.textTheme.displayLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_outline,
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
            const Text("[Last bot answer]"),
            const Spacer(),
            const TripplePriceWidget(),
          ],
        ),
      ),
    );
  }
}
