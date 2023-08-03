import 'package:flutter/material.dart';
import 'package:weather_app/core/weather_model/weather_model.dart';
import 'package:weather_app/features/search/presentation/show_search_data_body.dart';

class ShowSearchData extends StatelessWidget {
  const ShowSearchData({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ShowSearchDataBody(weatherModel:weatherModel),
    );
  }
}
