import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class EnergyUnit extends DataUnit {
  final double value;
  final EnergyTypes type;

  EnergyUnit({required this.type, required this.value});

  factory EnergyUnit.fromJson(Map<String, dynamic>? json) {
    return EnergyUnit(
        value: json?[Constants.value] ?? 0.0,
        type: EnergyTypes.values.firstWhere(
            (element) => element.name == json?[Constants.type],
            orElse: () => EnergyTypes.CALORIES));
  }

  @override
  String get unit => type == EnergyTypes.KILOJOULES
      ? "kJ"
      : type == EnergyTypes.JOULES
          ? "J"
          : type == EnergyTypes.KILOCALORIES
              ? "kcal"
              : "cal";

  @override
  num get data => value;
}
