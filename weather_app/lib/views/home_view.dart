import 'package:flutter/material.dart';
import 'package:weather_app/widgets/build_app_bar.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Weather App",
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: NoWeatherBody(),
    );
  }
}
