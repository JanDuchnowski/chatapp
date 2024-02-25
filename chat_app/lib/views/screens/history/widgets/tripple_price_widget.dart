import 'package:flutter/material.dart';

class TripplePriceWidget extends StatelessWidget {
  const TripplePriceWidget({super.key, required this.priceList});
  final List<double> priceList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: priceList
          .map((e) => Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(80, 80, 80, 1))),
                  child: Center(child: Text(e.toString())),
                ),
              ))
          .toList(),
    );
  }
}
