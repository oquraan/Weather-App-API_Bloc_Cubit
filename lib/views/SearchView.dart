import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Services/WeatherService.dart';
import 'package:weather/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather/model/WeatherModel.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City "),
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              // onChanged: (value) {

              // },
              onSubmitted: (value) async {
                BlocProvider.of<GetWeatherCubit>(context).getWeather(country: value);
            //  weatherModel = await WeatherService(dio: Dio())
            //         .getCurrentWeather(country: value);

            //     log(weatherModel!.cityName);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  label: Icon(Icons.search),
                  //  labelText: "Search",

                  hintText: "Search ",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            )),
      ),
    );
  }
}

