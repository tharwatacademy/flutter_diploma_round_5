import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/build_app_bar.dart';
import 'package:weather_app/widgets/weather_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});
  static const routeName = 'weather';

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        ModalRoute.of(context)!.settings.arguments as WeatherModel;
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
      body: WeatherBody(weatherModel: weatherModel),
    );
  }
}
