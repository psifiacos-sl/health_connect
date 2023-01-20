import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class BloodGlucoseUnit extends DataUnit {
  final double value;
  final BloodGlucoseTypes type;

  BloodGlucoseUnit({required this.value, required this.type});

  factory BloodGlucoseUnit.fromJson(Map<String, dynamic>? json) {
    return BloodGlucoseUnit(
        value: json?[Constants.value] ?? 0.0,
        type: BloodGlucoseTypes.values.firstWhere(
            (element) => element.name == json?[Constants.type],
            orElse: () => BloodGlucoseTypes.MILLIMOLES_PER_LITER));
  }

  @override
  String get unit =>
      type == BloodGlucoseTypes.MILLIGRAMS_PER_DECILITER ? "mg/dL" : "mmol/L";

  @override
  num get data => value;
}
