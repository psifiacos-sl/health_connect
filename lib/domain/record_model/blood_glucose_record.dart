import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/blood_glucose_unit.dart';
import 'package:health_connect/enums.dart';

class BloodGlucoseRecord extends InstantaneousRecord {
  final BloodGlucoseUnit level;

  BloodGlucoseRecord({required this.level, required super.metadata});

  factory BloodGlucoseRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BloodGlucoseRecord(
        metadata: parent.metadata,
        level: BloodGlucoseUnit.fromJson(json[Constants.level]));
  }
}
