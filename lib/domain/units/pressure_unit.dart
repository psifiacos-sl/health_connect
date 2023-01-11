import 'package:health_connect/constants.dart';

class PressureUnit {
  final double value;

  PressureUnit(this.value);

  String get unit => "mmHg";

  factory PressureUnit.fromJson(Map<String, dynamic> json) {
    return PressureUnit(json[Constants.value]);
  }
}
