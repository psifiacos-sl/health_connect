import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class TemperatureUnit {
  final double value;
  final TemperatureTypes type;

  TemperatureUnit({required this.value, required this.type});

  String get unit =>
      type == TemperatureTypes.FAHRENHEIT ? "Fahrenheit" : "Celsius";

  factory TemperatureUnit.fromJson(Map<String, dynamic> json) {
    return TemperatureUnit(
        value: json[Constants.value],
        type: TemperatureTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }
}
