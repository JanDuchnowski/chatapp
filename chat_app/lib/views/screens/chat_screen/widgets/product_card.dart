import 'package:chat_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductRecommendationCard extends StatelessWidget {
  const ProductRecommendationCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 1,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        
        children: [
          CircleAvatar(   radius: 48,backgroundImage: NetworkImage (product.image, )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children:[ Text(product.description), Text(product.price.toString()), Text(product.bestFor.toString(),),]
          ),
        ],
      ),
    );
  }
}