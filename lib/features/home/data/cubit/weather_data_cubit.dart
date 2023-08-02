import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
import '../../../../core/weather_model/weather_model.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
  static WeatherDataCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;
  void getData({required endpoint}) {
    emit(WeatherDataLoading());
    DioHelper().getData(endpoint: endpoint).then((value) {
      weatherModel = WeatherModel.fromMap(value);
      emit(WeatherDataSuccess());
    }).catchError((e) {
      emit(WeatherDataError(e: e));
    });
  }
}
