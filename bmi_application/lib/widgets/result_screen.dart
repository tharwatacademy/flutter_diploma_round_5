import 'package:bmi_application/widgets/hom_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmiResult});
  final double bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.ac_unit),
        ),
      ),
      body: Center(child: Text('Result = $bmiResult')),
    );
  }
}
