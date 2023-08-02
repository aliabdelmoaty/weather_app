import 'dart:convert';

import 'package:collection/collection.dart';

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromMap(Map<String, dynamic> data) => Astro(
        sunrise: data['sunrise'] as String?,
        sunset: data['sunset'] as String?,
        moonrise: data['moonrise'] as String?,
        moonset: data['moonset'] as String?,
        moonPhase: data['moon_phase'] as String?,
        moonIllumination: data['moon_illumination'] as String?,
        isMoonUp: data['is_moon_up'] as int?,
        isSunUp: data['is_sun_up'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
        'is_moon_up': isMoonUp,
        'is_sun_up': isSunUp,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Astro].
  factory Astro.fromJson(String data) {
    return Astro.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Astro] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Astro) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      moonPhase.hashCode ^
      moonIllumination.hashCode ^
      isMoonUp.hashCode ^
      isSunUp.hashCode;
}
