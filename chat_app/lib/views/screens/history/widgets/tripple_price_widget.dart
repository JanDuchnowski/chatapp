import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TripplePriceWidget extends StatefulWidget {
  const TripplePriceWidget({
    super.key,
  });

  @override
  State<TripplePriceWidget> createState() => _TripplePriceWidgetState();
}

class _TripplePriceWidgetState extends State<TripplePriceWidget> {
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      activeColor: Colors.black,
      inactiveColor: const Color.fromARGB(255, 171, 152, 152),
      min: 0.0,
      max: 100.0,
      values: _values,
      showLabels: true,
      edgeLabelPlacement: EdgeLabelPlacement.auto,
      labelFormatterCallback: (dynamic actualValue, String formattedText) {
        return '\$$formattedText';
      },
      interval: 40,
      showTicks: true,
      showDividers: true,
      enableTooltip: false,
      stepSize: 10,
      minorTicksPerInterval: 1,
      onChanged: (dynamic values) {
        setState(() {
          _values = values;
        });
      },
    );
  }
}
