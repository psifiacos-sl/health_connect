import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';

class PercentageUnit extends DataUnit{
  final double value;

  PercentageUnit(this.value);


  factory PercentageUnit.fromJson(Map<String, dynamic> json) {
    return PercentageUnit(json[Constants.value]);
  }

  @override
  String get unit => "%";

  @override
  num get data => value;
}
