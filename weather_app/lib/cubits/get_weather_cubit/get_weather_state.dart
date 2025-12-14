part of 'get_weather_cubit.dart';

class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class GetWeatherLoading extends GetWeatherState {}

class GetWeatherSuccess extends GetWeatherState {
  final WeatherModel weatherModel;

  GetWeatherSuccess(this.weatherModel);
}

class GetWeatherFailure extends GetWeatherState {
  final String errMessage;

  GetWeatherFailure(this.errMessage);
}
