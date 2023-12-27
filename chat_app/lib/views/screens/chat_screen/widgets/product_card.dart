import 'package:chat_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductRecommendationCard extends StatelessWidget {
  const ProductRecommendationCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(product.bestFor == "Category 3" || product.description == "Product 5 description") 
          Text(product.bestFor == "Category 3"?  "Best seller": product.description == "Product 5 description" ? "Best price" :  "", style:  TextStyle( color: product.bestFor == "Category 3"? Colors.redAccent: Colors.greenAccent,fontWeight: FontWeight.bold, fontSize: 20),),
          Container(
          height: 150,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).cardColor,
              border: product.bestFor == "Category 3"?  Border.all(color: Colors.red ): product.description == "Product 5 description" ? Border.all(color: Colors.greenAccent) :  null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 64,backgroundImage: NetworkImage (product.image, )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:[ Text(product.description), Text(product.price.toString()), Text(product.bestFor.toString(),),]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}