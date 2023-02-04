import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/mass_unit.dart';

class WeightRecord extends InstantaneousRecord {
  final MassUnit weight;

  WeightRecord(
      {required this.weight,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory WeightRecord.fromJson(Map<String, dynamic>? json) {
    final parent = InstantaneousRecord.fromJson(json);
    return WeightRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        weight: MassUnit.fromJson(json?[Constants.weight]));
  }
}
