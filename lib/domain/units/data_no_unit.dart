import 'package:health_connect/domain/units/data_unit.dart';

class DataNoUnit extends DataUnit {
  final num value;
  final String? customUnit;
  final String? title;
  final String? notes;

  DataNoUnit(this.value, {this.customUnit, this.title, this.notes});

  @override
  num get data => value;

  @override
  String get unit => customUnit ?? "";
}
