import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/history/widgets/link_tile.dart';
import 'package:chat_app/views/screens/history/widgets/tripple_price_widget.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search History'),
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
        height: 300,
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
            const Spacer(
              flex: 2,
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  child: Row(
                    children: [
                      Text("Price:"),
                      TripplePriceWidget(),
                    ],
                  ),
                ),
                if (ctxData.screenWidth > 500) const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: ctxData.screenWidth * 0.4 - 8,
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(), // new
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const LinkTile(
                            link: "https://www.amazon.com",
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
