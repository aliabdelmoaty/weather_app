// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_data_cubit.dart';

@immutable
abstract class WeatherDataState {}

class WeatherDataInitial extends WeatherDataState {}

class WeatherDataLoading extends WeatherDataState {}

class WeatherDataSuccess extends WeatherDataState {}

class WeatherDataError extends WeatherDataState {
  final String e;
  WeatherDataError({
    required this.e,
  });
}
