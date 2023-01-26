import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/length_unit.dart';
import 'package:health_connect/enums.dart';

class DistanceRecord extends IntervalRecord {
  final LengthUnit distance;

  DistanceRecord({required this.distance, required super.metadata, super.startTime,
    super.endTime,
    super.startZoneOffset,
    super.endZoneOffset});

  factory DistanceRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return DistanceRecord(
        distance: LengthUnit.fromJson(json[Constants.distance]),
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        metadata: parent.metadata);
  }
}
