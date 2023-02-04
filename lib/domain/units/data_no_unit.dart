import 'package:health_connect/domain/units/data_unit.dart';

class DataNoUnit extends DataUnit {
  final num value;
  final String? customUnit;

  DataNoUnit(this.value, {this.customUnit});

  @override
  num get data => value;

  @override
  String get unit => customUnit ?? "";
}
