import 'package:chat_app/models/product.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/price_container.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';

class ProductRecommendationCard extends StatelessWidget {
  const ProductRecommendationCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: product.bestFor == "Category 3"
            ? Border.all(color: Colors.red)
            : product.description == "Product 5 description"
                ? Border.all(color: Colors.greenAccent)
                : Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      height: 180,
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: ctxData.textTheme.bodyLarge,
              ),
              SizedBox(
                width: 8,
              ),
              PriceContainer(title: product.price.toString()),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.ios_share,
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(product.description),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
