import 'package:flutter/material.dart';

import 'widgets/hom_screen.dart';

void main() {
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
