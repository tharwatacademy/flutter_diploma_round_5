import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/weather_view.dart';

import 'views/weather_search_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("rebuilding this ui ");
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            routes: {
              HomeView.routeName: (context) => HomeView(),
              WeatherView.routeName: (context) => WeatherView(),
              WeatherSearchView.routeName: (context) => WeatherSearchView(),
            },
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(
                seedColor: getWeatherModel(context) == null
                    ? Colors.blue
                    : getcolor(getWeatherModel(context)!.weatherState),
              ),
            ),
            initialRoute: HomeView.routeName,
          );
        },
      ),
    );
  }

  WeatherModel? getWeatherModel(BuildContext context) {
    return context.watch<GetWeatherCubit>().weatherModel;
  }
}
