import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({
    super.key,
    required this.title,
    this.isAnimated = false,
    this.isDarkMode = false,
    this.fullScreenWidth,
    this.onFinished,
  });

  final String title;
  final bool isAnimated;
  final bool isDarkMode;
  final bool? fullScreenWidth;
  final Function? onFinished;

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  void initState() {
    if (widget.onFinished != null) {
      widget.onFinished!();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullScreenWidth != null
          ? MediaQuery.of(context).size.width
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.isDarkMode ? Color.fromRGBO(80, 80, 80, 1) : Colors.white,
        border: Border.all(color: const Color.fromRGBO(80, 80, 80, 1)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, top: 8, bottom: 8, right: 18),
        child: widget.isAnimated
            ? AnimatedTextKit(
                pause: const Duration(milliseconds: 500),
                isRepeatingAnimation: false,
                onFinished: widget.onFinished != null
                    ? () {
                        widget.onFinished!();
                      }
                    : null,
                animatedTexts: [
                  TyperAnimatedText(
                    widget.title,
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: widget.isDarkMode
                          ? Colors.white
                          : const Color.fromRGBO(80, 80, 80, 1),
                    ),
                  )
                ],
              )
            : Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isDarkMode
                      ? Colors.white
                      : const Color.fromRGBO(80, 80, 80, 1),
                ),
              ),
      ),
    );
  }
}
