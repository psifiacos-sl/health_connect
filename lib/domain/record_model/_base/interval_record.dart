import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/record.dart';

class IntervalRecord extends Record {
  final int startTime;
  final int endTime;
  final int? startZoneOffset;
  final int? endZoneOffset;

  IntervalRecord(
      {required super.metadata,
      required this.startTime,
      required this.endTime,
      this.endZoneOffset,
      this.startZoneOffset});

  factory IntervalRecord.fromJson(Map<String, dynamic>? json) {
    final record = Record.fromJson(json);
    return IntervalRecord(
        metadata: record.metadata,
        startTime: json?[Constants.startTime],
        endTime: json?[Constants.endTime],
        startZoneOffset: json?[Constants.startZoneOffset],
        endZoneOffset: json?[Constants.endZoneOffset]);
  }
}
