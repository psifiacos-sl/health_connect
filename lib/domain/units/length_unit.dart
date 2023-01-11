import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class LengthUnit {
  final double value;
  final LengthTypes type;

  LengthUnit({required this.value, required this.type});

  String get unit => type == LengthTypes.FEET
      ? "feet"
      : type == LengthTypes.INCHES
          ? "inches"
          : type == LengthTypes.MILES
              ? "miles"
              : type == LengthTypes.KILOMETERS
                  ? "kilometers"
                  : "meters";

  factory LengthUnit.fromJson(Map<String, dynamic> json) {
    return LengthUnit(
        value: json[Constants.value],
        type: LengthTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
