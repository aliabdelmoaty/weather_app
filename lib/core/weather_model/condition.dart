import 'dart:convert';

import 'package:collection/collection.dart';

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromMap(Map<String, dynamic> data) => Condition(
        text: data['text'] as String?,
        icon: data['icon'] as String?,
        code: data['code'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'icon': icon,
        'code': code,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Condition].
  factory Condition.fromJson(String data) {
    return Condition.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Condition] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Condition) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}
