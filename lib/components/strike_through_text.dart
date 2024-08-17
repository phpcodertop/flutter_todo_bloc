import 'package:flutter/material.dart';

class StrikeThroughText extends StatelessWidget {
  final String text;
  final bool isLineThrough;

  const StrikeThroughText(
      {super.key, required this.text, required this.isLineThrough});

  @override
  Widget build(BuildContext context) {
    if (isLineThrough) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          decoration: TextDecoration.lineThrough,
        ),
      );
    }
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
