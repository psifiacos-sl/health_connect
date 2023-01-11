import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class EnergyUnit {
  final double value;
  final EnergyTypes type;

  EnergyUnit({required this.value, required this.type});

  String get unit => type == EnergyTypes.KILOJOULES
      ? "kJ"
      : type == EnergyTypes.JOULES
          ? "J"
          : type == EnergyTypes.KILOCALORIES
              ? "kcal"
              : "cal";

  factory EnergyUnit.fromJson(Map<String, dynamic> json) {
    return EnergyUnit(
        value: json[Constants.value],
        type: EnergyTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
