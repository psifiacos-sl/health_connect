import 'package:health_connect/domain/record.dart';
import 'package:health_connect/domain/zoneoffset.dart';

class IntervalRecord extends Record {
  final DateTime startTime;
  final DateTime endTime;
  final ZoneOffset? startZoneOffset;
  final ZoneOffset? endZoneOffset;

  IntervalRecord(
      {required super.metadata,
      required this.startTime,
      required this.endTime,
      this.endZoneOffset,
      this.startZoneOffset});

  factory IntervalRecord.fromJson(Map<String, dynamic> json) {
    return IntervalRecord(
        metadata: Record.fromJson(json).metadata,
        startTime: DateTime.fromMillisecondsSinceEpoch(
            DateTime(1970).millisecondsSinceEpoch),
        endTime: DateTime(1970));
  }
}
