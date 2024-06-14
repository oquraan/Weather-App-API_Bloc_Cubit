import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather/main.dart';
import 'package:weather/model/WeatherModel.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    var weatherMOdel=  BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(colors: [

          getThemeColor(weatherMOdel!.weatherCondition),
          getThemeColor(weatherMOdel.weatherCondition)[300]!,
          getThemeColor(weatherMOdel.weatherCondition)[50]!

        ]
        ,
        begin: Alignment.topCenter,end:  Alignment.bottomCenter
        )
      ),
      child: Padding(  
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherMOdel!.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at ${DateFormat.yMd().format(DateTime.parse(weatherMOdel.date))}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                "https:${  weatherMOdel.image!}",
                ),
                 Text(
                  weatherMOdel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                    "MaxTemp: ${  weatherMOdel.maxTemp.round()}" ,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "MinTemp: ${weatherMOdel.minTemp.round()}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherMOdel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
