import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/mass_unit.dart';

class BoneMassRecord extends InstantaneousRecord {
  final MassUnit mass;

  BoneMassRecord(
      {required this.mass,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory BoneMassRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BoneMassRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        mass: MassUnit.fromJson(json[Constants.mass]));
  }
}
