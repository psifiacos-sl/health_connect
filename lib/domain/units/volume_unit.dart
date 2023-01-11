import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class VolumeUnit {
  final double value;
  final VolumeTypes type;

  VolumeUnit({required this.value, required this.type});

  String get unit => type == VolumeTypes.FLUID_OUNCES_US
      ? "fl. oz (US)"
      : type == VolumeTypes.MILLILITERS
          ? "mL"
          : "L";

  factory VolumeUnit.fromJson(Map<String, dynamic> json) {
    return VolumeUnit(
        value: json[Constants.value],
        type: VolumeTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
