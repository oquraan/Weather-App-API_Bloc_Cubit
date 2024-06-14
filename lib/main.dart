import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherState.dart';
import 'package:weather/views/HomeView.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetWeatherCubit();
      },
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState >(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              )),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case null:
      return Colors.green;

    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.brown;
    case "Patchy rain possible":
      return Colors.lightBlue;
    case "Patchy snow possible":
      return Colors.lightBlue;
    case "Patchy sleet possible":
      return Colors.lightBlue;
    case "Patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
      return Colors.lightBlue;
    case "Blizzard":
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy light drizzle":
      return Colors.lightBlue;
    case "Light drizzle":
      return Colors.blue;
    case "Freezing drizzle":
      return Colors.cyan;
    case "Heavy freezing drizzle":
      return Colors.cyan;
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Light rain":
      return Colors.blue;
    case "Moderate rain at times":
      return Colors.blue;
    case "Moderate rain":
      return Colors.blue;
    case "Heavy rain at times":
      return Colors.indigo;
    case "Heavy rain":
      return Colors.indigo;
    case "Light freezing rain":
      return Colors.cyan;
    case "Moderate or heavy freezing rain":
      return Colors.cyan;
    case "Light sleet":
      return Colors.lightBlue;
    case "Moderate or heavy sleet":
      return Colors.blue;
    case "Patchy light snow":
      return Colors.lightBlue;
    case "Light snow":
      return Colors.lightBlue;
    case "Patchy moderate snow":
      return Colors.lightBlue;
    case "Moderate snow":
      return Colors.blue;
    case "Patchy heavy snow":
      return Colors.blue;
    case "Heavy snow":
      return Colors.blue;
    case "Ice pellets":
      return Colors.cyan;
    case "Light rain shower":
      return Colors.lightBlue;
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
      return Colors.indigo;
    case "Light sleet showers":
      return Colors.lightBlue;
    case "Moderate or heavy sleet showers":
      return Colors.blue;
    case "Light snow showers":
      return Colors.lightBlue;
    case "Moderate or heavy snow showers":
      return Colors.blue;
    case "Light showers of ice pellets":
      return Colors.cyan;
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "Patchy light rain with thunder":
      return Colors.deepPurple;
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy light snow with thunder":
      return Colors.deepPurple;
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
