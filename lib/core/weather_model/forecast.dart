import 'dart:convert';

import 'package:collection/collection.dart';

import 'forecastday.dart';

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromMap(Map<String, dynamic> data) => Forecast(
        forecastday: (data['forecastday'] as List<dynamic>?)
            ?.map((e) => Forecastday.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'forecastday': forecastday?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Forecast].
  factory Forecast.fromJson(String data) {
    return Forecast.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Forecast] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Forecast) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => forecastday.hashCode;
}
