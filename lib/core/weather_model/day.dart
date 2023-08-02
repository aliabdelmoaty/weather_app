import 'dart:convert';

import 'package:collection/collection.dart';

import 'air_quality.dart';
import 'condition.dart';

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  AirQuality? airQuality;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
    this.airQuality,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: data['maxtemp_c'] as double?,
        maxtempF: (data['maxtemp_f'] as num?)?.toDouble(),
        mintempC: (data['mintemp_c'] as num?)?.toDouble(),
        mintempF: (data['mintemp_f'] as num?)?.toDouble(),
        avgtempC: (data['avgtemp_c'] as num?)?.toDouble(),
        avgtempF: (data['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (data['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: (data['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: (data['totalprecip_mm'] as num?)?.toDouble(),
        totalprecipIn: (data['totalprecip_in'] as num?)?.toDouble(),
        totalsnowCm: data['totalsnow_cm'] as double?,
        avgvisKm: (data['avgvis_km'] as num?)?.toDouble(),
        avgvisMiles: data['avgvis_miles'] as double?,
        avghumidity: data['avghumidity'] as double?,
        dailyWillItRain: data['daily_will_it_rain'] as int?,
        dailyChanceOfRain: data['daily_chance_of_rain'] as int?,
        dailyWillItSnow: data['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: data['daily_chance_of_snow'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: data['uv'] as double?,
        airQuality: data['air_quality'] == null
            ? null
            : AirQuality.fromMap(data['air_quality'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toMap(),
        'uv': uv,
        'air_quality': airQuality?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Day].
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Day] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Day) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      maxtempC.hashCode ^
      maxtempF.hashCode ^
      mintempC.hashCode ^
      mintempF.hashCode ^
      avgtempC.hashCode ^
      avgtempF.hashCode ^
      maxwindMph.hashCode ^
      maxwindKph.hashCode ^
      totalprecipMm.hashCode ^
      totalprecipIn.hashCode ^
      totalsnowCm.hashCode ^
      avgvisKm.hashCode ^
      avgvisMiles.hashCode ^
      avghumidity.hashCode ^
      dailyWillItRain.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyWillItSnow.hashCode ^
      dailyChanceOfSnow.hashCode ^
      condition.hashCode ^
      uv.hashCode ^
      airQuality.hashCode;
}
