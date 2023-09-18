import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
import '../../../../core/weather_model/weather_model.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
  static WeatherDataCubit get(context) => BlocProvider.of(context);
  LocationData? currentLocation;
  WeatherModel? weatherModel;
  void getData() async {
    emit(WeatherDataLoading());
    await getLocation().then((value) async {
      LocationData? location = value;
      await getAddress(location?.latitude, location?.longitude)
          .then((value) async {
        currentLocation = location;
        await DioHelper().getData(endpoint: value).then((value) {
          weatherModel = WeatherModel.fromMap(value);
        });
      });
      emit(WeatherDataSuccess());
    }).catchError((e) {
      emit(WeatherDataError(e: e));
    });
  }
    Location location = new Location();

  Future<LocationData?> getLocation() async {
    LocationData _locationData;
    // location.enableBackgroundMode(enable: enableBackgroundMode());
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }
Future<bool> enableBackgroundMode() async {
    bool _bgModeEnabled = await location.isBackgroundModeEnabled();
    if (_bgModeEnabled) {
      return true;
    } else {
      try {
        await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      try {
        _bgModeEnabled = await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      print(_bgModeEnabled); //True!
      return _bgModeEnabled;
    }
  }
  Future<String> getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) return "";
    GeoCode geoCode = GeoCode();
    Address address =
        await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
    return "${address.city},";
  }
}
