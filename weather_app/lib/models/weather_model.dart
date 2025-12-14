import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final DateTime date;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final String weatherState;
  final String weatherIcon;

  WeatherModel({
    required this.city,
    required this.date,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherState,
    required this.weatherIcon,
  });

  factory WeatherModel.fromForecastJson(
    Map<String, dynamic> forecastDay,
    Map<String, dynamic> location,
  ) {
    return WeatherModel(
      city: location['name'] as String,
      date: DateTime.parse(forecastDay['date'] as String),
      temperature: (forecastDay['day']['avgtemp_c'] as num).toDouble(),
      maxTemperature: (forecastDay['day']['maxtemp_c'] as num).toDouble(),
      minTemperature: (forecastDay['day']['mintemp_c'] as num).toDouble(),
      weatherState: forecastDay['day']['condition']['text'] as String,
      weatherIcon: forecastDay['day']['condition']['icon'] as String,
    );
  }
}

MaterialColor getcolor(String weatherState) {
  final formattedWeatherState = weatherState.trim().toLowerCase();
  if (formattedWeatherState == 'sunny' ||
      formattedWeatherState.contains('clear')) {
    return Colors.amber;
  } else if (formattedWeatherState.contains('partly cloudy')) {
    return Colors.orange;
  } else if (formattedWeatherState.contains('cloudy') ||
      formattedWeatherState.contains('overcast')) {
    return Colors.blueGrey;
  } else if (formattedWeatherState.contains('mist') ||
      formattedWeatherState.contains('fog')) {
    return Colors.grey;
  } else if (formattedWeatherState.contains('rain') ||
      formattedWeatherState.contains('drizzle')) {
    return Colors.blue;
  } else if (formattedWeatherState.contains('snow') ||
      formattedWeatherState.contains('blizzard')) {
    return Colors.lightBlue;
  } else if (formattedWeatherState.contains('sleet') ||
      formattedWeatherState.contains('ice pellets')) {
    return Colors.indigo;
  } else if (formattedWeatherState.contains('freezing')) {
    return Colors.cyan;
  } else if (formattedWeatherState.contains('thunder')) {
    return Colors.deepPurple;
  } else {
    return Colors.teal;
  }
}
