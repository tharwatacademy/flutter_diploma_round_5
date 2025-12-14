import 'package:flutter/material.dart';

class NoWeatherBody extends StatefulWidget {
  const NoWeatherBody({super.key});

  @override
  State<NoWeatherBody> createState() => _NoWeatherBodyState();
}

class _NoWeatherBodyState extends State<NoWeatherBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "there is no weather 😔 start searching now 🌤️",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
