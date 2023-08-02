import 'dart:convert';

import 'package:collection/collection.dart';

class Alerts {
  List<dynamic>? alert;

  Alerts({this.alert});

  factory Alerts.fromMap(Map<String, dynamic> data) => Alerts(
        alert: data['alert'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'alert': alert,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Alerts].
  factory Alerts.fromJson(String data) {
    return Alerts.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Alerts] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Alerts) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => alert.hashCode;
}
