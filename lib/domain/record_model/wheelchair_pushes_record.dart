import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class WheelchairPushesRecord extends IntervalRecord {
  final DataNoUnit count;

  WheelchairPushesRecord(
      {required this.count,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory WheelchairPushesRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return WheelchairPushesRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        count: DataNoUnit(json[Constants.count]));
  }
}
