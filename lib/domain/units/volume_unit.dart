import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class VolumeUnit extends DataUnit {
  final double value;
  final VolumeTypes type;

  VolumeUnit({required this.value, required this.type});

  factory VolumeUnit.fromJson(Map<String, dynamic>? json) {
    return VolumeUnit(
        value: json?[Constants.value] ?? 0.0,
        type: VolumeTypes.values.firstWhere(
            (element) => element.name == json?[Constants.type],
            orElse: () => VolumeTypes.LITERS));
  }

  @override
  String get unit => type == VolumeTypes.FLUID_OUNCES_US
      ? "fl. oz (US)"
      : type == VolumeTypes.MILLILITERS
          ? "mL"
          : "L";

  @override
  num get data => value;
}
