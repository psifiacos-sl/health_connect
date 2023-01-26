import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class StepsRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  StepsRecord(
      {required super.metadata, super.startTime,
        super.endTime,
        super.startZoneOffset,
        super.endZoneOffset,
      required this.dataNoUnit});

  factory StepsRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return StepsRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        dataNoUnit: DataNoUnit(json[Constants.count]));
  }
}
