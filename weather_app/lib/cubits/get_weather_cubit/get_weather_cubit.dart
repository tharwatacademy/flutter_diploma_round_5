import 'package:bloc/bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

  WeatherModel? weatherModel;
  Future<void> getWeatherForcast({required String cityName}) async {
    emit(GetWeatherLoading());
    try {
      var weatherModels = await WeatherService().getWeatherForcast(
        cityName: cityName,
      );
      weatherModel = weatherModels.first;
      emit(GetWeatherSuccess(weatherModels.first));
    } catch (e) {
      emit(GetWeatherFailure(e.toString()));
    }
  }
}


// determine and create states 
// create cubit 
// add logic 
// provide
// integrate cubit with ui 
// trigger cubit 