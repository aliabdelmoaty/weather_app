import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/dio_helper.dart';
import '../../../../core/weather_model/weather_model.dart';

part 'search_weather_state.dart';

class SearchWeatherCubit extends Cubit<SearchWeatherState> {
  SearchWeatherCubit() : super(SearchWeatherInitial());
  WeatherModel? weatherModel;
  static SearchWeatherCubit get(context) => BlocProvider.of(context);
  void searchCityNameChanged({required String city}) async {
    emit(SearchWeatherLoading());
    await DioHelper().getData(endpoint: city).then((value) {
      weatherModel = WeatherModel.fromMap(value);
      emit(SearchWeatherSuccess(weatherModel:WeatherModel.fromMap(value) ));
    }).catchError((e) {
      emit(SearchWeatherError(e: e.toString()));
    });
  }
}
