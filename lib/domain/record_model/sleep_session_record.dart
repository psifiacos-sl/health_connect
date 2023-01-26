import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class SleepSessionRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  SleepSessionRecord({required this.dataNoUnit, required super.metadata, super.startTime,
    super.endTime,
    super.startZoneOffset,
    super.endZoneOffset});

  factory SleepSessionRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return SleepSessionRecord(
      metadata: parent.metadata,
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
      dataNoUnit: DataNoUnit(
        0,
        title: json[Constants.title],
        notes: json[Constants.notes],
      ),
    );
  }
}
