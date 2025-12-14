import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: .7),
            Theme.of(context).colorScheme.primary.withValues(alpha: .5),
            Theme.of(context).colorScheme.primary.withValues(alpha: .3),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel.city),
          Text("Updated at 12:00"),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                weatherModel.weatherIcon,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              Text("25"),
              Column(children: [Text("max : 25"), Text("min : 25")]),
            ],
          ),
          SizedBox(height: 32),
          Text("Light Cloud"),
        ],
      ),
    );
  }
}
