import 'package:health_connect/constants.dart';

class PercentageUnit {
  final double value;

  PercentageUnit(this.value);

  String get unit => "%";

  factory PercentageUnit.fromJson(Map<String, dynamic> json) {
    return PercentageUnit(json[Constants.value]);
  }
}
