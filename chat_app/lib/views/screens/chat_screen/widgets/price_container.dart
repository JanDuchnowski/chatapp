import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(80, 80, 80, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Text(
            "\$ $title",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
        ),
      ),
    );
  }
}
