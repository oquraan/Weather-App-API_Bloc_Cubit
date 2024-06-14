import 'package:weather/model/WeatherModel.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String ApiKey = "96f7acb323844f139cc174850241705";

  WeatherService({required this.dio});
  Future<WeatherModel?> getCurrentWeather({required String country}) async {
    try {
      Response response = await dio.get(
          "${baseUrl}/forecast.json?key=$ApiKey&q=$country &days=10&aqi=no&alerts=no");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ?? "oops there was an errore ";
      throw Exception(errorMessage);
      // TODO
    } catch (e) {
      throw Exception("oops there was an error , try later ");
    }
  }
}
