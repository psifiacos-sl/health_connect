import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';

class PressureUnit extends DataUnit{
  final double value;

  PressureUnit(this.value);

  factory PressureUnit.fromJson(Map<String, dynamic>? json) {
    return PressureUnit(json?[Constants.value] ?? 0.0);
  }

  @override
  String get unit => "mmHg";

  @override
  num get data => value;

}
