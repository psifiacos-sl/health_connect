import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/length_unit.dart';

class ExerciseLapRecord extends IntervalRecord {
  final LengthUnit length;

  ExerciseLapRecord(
      {required this.length,
      required super.metadata,
      super.startTime,
      super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory ExerciseLapRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseLapRecord(
      length: LengthUnit.fromJson(json[Constants.length]),
      metadata: parent.metadata,
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
    );
  }
}
