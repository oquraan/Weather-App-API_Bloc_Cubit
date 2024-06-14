import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherState.dart';
import 'package:weather/views/SearchView.dart';
import 'package:weather/widgets/NoWeather.dart';
import 'package:weather/widgets/WeatherInfo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchView()));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SearchView()),
                  // );
                },
                icon: Icon(
                  Icons.search,
                ))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is noWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody( weatherModel: state.weatherModel,);
            } else {
              return const Text("opps there was an errore ");
            }
          },
        ));
  }
}
