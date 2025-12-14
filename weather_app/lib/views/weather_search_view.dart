import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/weather_view.dart';
import 'package:weather_app/widgets/build_app_bar.dart';

class WeatherSearchView extends StatefulWidget {
  const WeatherSearchView({super.key});

  static const routeName = 'search';

  @override
  State<WeatherSearchView> createState() => _WeatherSearchViewState();
}

class _WeatherSearchViewState extends State<WeatherSearchView> {
  String city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Search a city"),
      body: BlocConsumer<GetWeatherCubit, GetWeatherState>(
        listener: (context, state) {
          if (state is GetWeatherSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, WeatherView.routeName, (
              route,
            ) {
              print(route.settings.name);
              return false;
            }, arguments: state.weatherModel);
          } else if (state is GetWeatherFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is GetWeatherLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    city = value;
                  },
                  onSubmitted: (value) {
                    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                      context,
                    );
                    getWeatherCubit.getWeatherForcast(cityName: value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 16,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                          context,
                        );
                        getWeatherCubit.getWeatherForcast(cityName: city);
                      },
                      icon: Icon(Icons.search),
                    ),
                    labelText: "Search",
                    hintText: "Enter City Name",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red),
    );
  }
}


  // var weatherModels = await WeatherService()
  //                       .getWeatherForcast(cityName: city);

  // 1- determine and create states 
  // 2 create cubit
