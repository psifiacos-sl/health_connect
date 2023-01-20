import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class VelocityUnit extends DataUnit {
  final double value;
  final VelocityTypes type;

  VelocityUnit({required this.value, required this.type});

  factory VelocityUnit.fromJson(Map<String, dynamic>? json) {
    return VelocityUnit(
        value: json?[Constants.value] ?? 0.0,
        type: VelocityTypes.values.firstWhere(
            (element) => element.name == json?[Constants.type],
            orElse: () => VelocityTypes.METERS_PER_SECOND));
  }

  @override
  String get unit => type == VelocityTypes.MILES_PER_HOUR
      ? "miles/h"
      : type == VelocityTypes.KILOMETERS_PER_HOUR
          ? "km/h"
          : "meters/sec";

  @override
  num get data => value;
}
