import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomBarWidget(
      {super.key, this.height = kToolbarHeight, required this.title});

  final double height;

  final String title;

  @override
  State<CustomBarWidget> createState() => _CustomBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}

class _CustomBarWidgetState extends State<CustomBarWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  SfRangeValues _values = const SfRangeValues(40.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.only(left: 20.0),
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      Text(
                        widget.title,
                        style: const TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
              child: SfRangeSlider(
                activeColor: Colors.black,
                inactiveColor: const Color.fromARGB(255, 171, 152, 152),
                min: 0.0,
                max: 100.0,
                values: _values,
                showLabels: true,
                labelFormatterCallback:
                    (dynamic actualValue, String formattedText) {
                  return '\$ $formattedText';
                },
                interval: 10,
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
              ),
              // RangeSlider(
              //   activeColor: Colors.black,
              //   inactiveColor: const Color.fromARGB(255, 171, 152, 152),
              //   overlayColor: MaterialStatePropertyAll(Colors.black),
              //   divisions: 10,
              //   values: RangeValues(_minRangeValue, _maxRangeValue),
              //   onChanged: (value) {
              //     setState(() {
              //       _minRangeValue = value.start;
              //       _maxRangeValue = value.end;
              //     });
              //   },
              //   min: 0,
              //   max: 100,
              //   labels: RangeLabels(
              //     _minRangeValue.toString(),
              //     _maxRangeValue.toString(),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
