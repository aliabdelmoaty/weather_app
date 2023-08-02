import 'dart:convert';

import 'package:collection/collection.dart';

import 'alerts.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  WeatherModel({this.location, this.current, this.forecast, this.alerts});

  factory WeatherModel.fromMap(Map<String, dynamic> data) => WeatherModel(
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
        current: data['current'] == null
            ? null
            : Current.fromMap(data['current'] as Map<String, dynamic>),
        forecast: data['forecast'] == null
            ? null
            : Forecast.fromMap(data['forecast'] as Map<String, dynamic>),
        alerts: data['alerts'] == null
            ? null
            : Alerts.fromMap(data['alerts'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'location': location?.toMap(),
        'current': current?.toMap(),
        'forecast': forecast?.toMap(),
        'alerts': alerts?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WeatherModel].
  factory WeatherModel.fromJson(String data) {
    return WeatherModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WeatherModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WeatherModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      location.hashCode ^
      current.hashCode ^
      forecast.hashCode ^
      alerts.hashCode;
}
