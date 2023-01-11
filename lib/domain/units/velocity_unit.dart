import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class VelocityUnit {
  final double value;
  final VelocityTypes type;

  VelocityUnit({required this.value, required this.type});

  String get unit => type == VelocityTypes.MILES_PER_HOUR
      ? "miles/h"
      : type == VelocityTypes.KILOMETERS_PER_HOUR
          ? "km/h"
          : "meters/sec";

  factory VelocityUnit.fromJson(Map<String, dynamic> json) {
    return VelocityUnit(
        value: json[Constants.value],
        type: VelocityTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
