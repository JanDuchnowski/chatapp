import 'package:chat_app/models/product.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:flutter/material.dart';

class DetailsPopUp extends StatelessWidget {
  const DetailsPopUp({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return Container(
      height: ctxData.screenHeight * 0.6,
      width: ctxData.screenWidth * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //   color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: ctxData.screenHeight * 0.6,
          width: ctxData.screenWidth * 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Product Name',
                    style: ctxData.textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
                style: ctxData.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
