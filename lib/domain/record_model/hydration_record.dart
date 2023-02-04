import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/volume_unit.dart';

class HydrationRecord extends IntervalRecord {
  final VolumeUnit volume;

  HydrationRecord(
      {required this.volume,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory HydrationRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return HydrationRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        volume: VolumeUnit.fromJson(json[Constants.volume]));
  }
}
