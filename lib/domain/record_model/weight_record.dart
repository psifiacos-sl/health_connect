import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/mass_unit.dart';

class WeightRecord extends InstantaneousRecord {
  final MassUnit mass;

  WeightRecord({required this.mass, required super.metadata, super.time,
    super.zoneOffset});

  factory WeightRecord.fromJson(Map<String, dynamic>? json) {
    final parent = InstantaneousRecord.fromJson(json);
    return WeightRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        mass: MassUnit.fromJson(json?[Constants.mass]));
  }
}
