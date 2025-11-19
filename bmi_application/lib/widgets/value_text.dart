import 'package:flutter/material.dart';

class ValueText extends StatelessWidget {
  const ValueText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.alphabetic,
      ),
    );
  }
}
