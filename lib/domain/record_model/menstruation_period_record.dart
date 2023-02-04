import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class MenstruationPeriodRecord extends IntervalRecord {
  MenstruationPeriodRecord(
      {required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory MenstruationPeriodRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return MenstruationPeriodRecord(
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
      metadata: parent.metadata,
    );
  }
}
