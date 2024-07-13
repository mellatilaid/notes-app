import 'package:flutter/material.dart';
import 'package:note_app/helper/const.dart';

class FadeAnimatedText extends StatelessWidget {
  const FadeAnimatedText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.slowMiddle,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 30),
            child: child,
          ),
        );
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kSecondryColor,
        ),
      ),
    );
  }
}
