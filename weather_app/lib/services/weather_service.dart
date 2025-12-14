import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  String apiKey = "6b05ff5d369445b183f171540252611";
  Future<List<WeatherModel>> getWeatherForcast({
    required String cityName,
  }) async {
    try {
      Response response = await dio.get(
        "http://api.weatherapi.com/v1/forecast.json",
        queryParameters: {"key": apiKey, "q": cityName},
      );
      List<WeatherModel> weatherModels = [];
      for (
        int i = 0;
        i < response.data["forecast"]["forecastday"].length;
        i++
      ) {
        final day = response.data["forecast"]["forecastday"][i];
        final location = response.data["location"];
        weatherModels.add(WeatherModel.fromForecastJson(day, location));
      }
      return weatherModels;
    } on DioException catch (e) {
      String message = e.response?.data["error"]["message"];
      throw Exception(message);
    } catch (e) {
      throw Exception("Something went wrong try");
    }
  }
}
