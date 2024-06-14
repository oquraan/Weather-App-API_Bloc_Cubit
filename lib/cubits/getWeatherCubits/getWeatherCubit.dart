import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Services/WeatherService.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherState.dart';
import 'package:weather/model/WeatherModel.dart';
import 'package:weather/views/SearchView.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(noWeatherState());
    WeatherModel? weatherModel;

  getWeather({required country}) async {
    try {
    weatherModel =
          (await WeatherService(dio: Dio()).getCurrentWeather(country: country))!;

      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
      // TODO
    }
  }
}
 