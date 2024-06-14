import 'package:weather/model/WeatherModel.dart';

class WeatherState {}

class noWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
