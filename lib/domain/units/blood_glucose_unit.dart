import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class BloodGlucoseUnit {
  final double value;
  final BloodGlucoseTypes type;

  BloodGlucoseUnit({required this.value, required this.type});

  String get unit =>
      type == BloodGlucoseTypes.MILLIGRAMS_PER_DECILITER ? "mg/dL" : "mmol/L";

  factory BloodGlucoseUnit.fromJson(Map<String, dynamic> json) {
    return BloodGlucoseUnit(
        value: json[Constants.value],
        type: BloodGlucoseTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
