import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    this.isAnimated = false,
    this.isDarkMode = false,
  });

  final String title;
  final bool isAnimated;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode ? Color.fromRGBO(80, 80, 80, 1) : Colors.white,
        border: Border.all(color: const Color.fromRGBO(80, 80, 80, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 8, bottom: 8),
        child: isAnimated
            ? AnimatedTextKit(
                pause: const Duration(milliseconds: 500),
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(title,
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: isDarkMode
                            ? Colors.white
                            : const Color.fromRGBO(80, 80, 80, 1),
                      ))
                ],
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isDarkMode
                          ? Colors.white
                          : const Color.fromRGBO(80, 80, 80, 1),
                    ),
              ),
      ),
    );
  }
}
