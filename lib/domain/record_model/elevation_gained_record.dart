import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/length_unit.dart';

class ElevationGainedRecord extends IntervalRecord {
  final LengthUnit elevation;

  ElevationGainedRecord(
      {required this.elevation,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory ElevationGainedRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ElevationGainedRecord(
      elevation: LengthUnit.fromJson(json[Constants.elevation]),
      metadata: parent.metadata,
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
    );
  }
}
