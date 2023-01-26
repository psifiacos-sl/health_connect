import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/pressure_unit.dart';

class BloodPressureRecord extends InstantaneousRecord {
  final PressureUnit systolic;
  final PressureUnit diastolic;

  BloodPressureRecord(
      {required this.systolic,
      required this.diastolic,
      required super.metadata,
        super.time,
        super.zoneOffset});

  factory BloodPressureRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BloodPressureRecord(
      metadata: parent.metadata,
      time: parent.time,
      zoneOffset: parent.zoneOffset,
      diastolic: PressureUnit.fromJson(json[Constants.diastolic]),
      systolic: PressureUnit.fromJson(json[Constants.systolic]),
    );
  }
}
