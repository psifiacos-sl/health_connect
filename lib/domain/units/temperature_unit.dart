import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class TemperatureUnit extends DataUnit {
  final double value;
  final TemperatureTypes type;

  TemperatureUnit({required this.value, required this.type});

  factory TemperatureUnit.fromJson(Map<String, dynamic>? json) {
    return TemperatureUnit(
        value: json?[Constants.value] ?? 0.0,
        type: TemperatureTypes.values.firstWhere(
            (element) => element.name == json?[Constants.type],
            orElse: () => TemperatureTypes.CELSIUS));
  }

  @override
  String get unit =>
      type == TemperatureTypes.FAHRENHEIT ? "Fahrenheit" : "Celsius";

  @override
  num get data => value;
}
