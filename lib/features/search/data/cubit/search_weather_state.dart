// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_weather_cubit.dart';

@immutable
abstract class SearchWeatherState {}

class SearchWeatherInitial extends SearchWeatherState {}

class SearchWeatherLoading extends SearchWeatherState {}

class SearchWeatherSuccess extends SearchWeatherState {
  WeatherModel weatherModel;
  SearchWeatherSuccess({
    required this.weatherModel,
  });
}

class SearchWeatherError extends SearchWeatherState {
  final String e;
  SearchWeatherError({
    required this.e,
  });
}
