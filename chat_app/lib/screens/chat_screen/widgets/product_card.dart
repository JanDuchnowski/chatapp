import 'package:chat_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductRecommendationCard extends StatelessWidget {
  const ProductRecommendationCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children:[Image.network(product.image), Text(product.description), Text(product.price.toString()), Text(product.bestFor.toString())]
      ),
    );
  }
}