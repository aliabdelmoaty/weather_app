import 'dart:convert';

import 'package:collection/collection.dart';

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromMap(Map<String, dynamic> data) => AirQuality(
        co: (data['co'] as num?)?.toDouble(),
        no2: (data['no2'] as num?)?.toDouble(),
        o3: (data['o3'] as num?)?.toDouble(),
        so2: (data['so2'] as num?)?.toDouble(),
        pm25: (data['pm2_5'] as num?)?.toDouble(),
        pm10: (data['pm10'] as num?)?.toDouble(),
        usEpaIndex: data['us-epa-index'] as int?,
        gbDefraIndex: data['gb-defra-index'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'co': co,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'us-epa-index': usEpaIndex,
        'gb-defra-index': gbDefraIndex,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AirQuality].
  factory AirQuality.fromJson(String data) {
    return AirQuality.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AirQuality] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AirQuality) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      co.hashCode ^
      no2.hashCode ^
      o3.hashCode ^
      so2.hashCode ^
      pm25.hashCode ^
      pm10.hashCode ^
      usEpaIndex.hashCode ^
      gbDefraIndex.hashCode;
}
