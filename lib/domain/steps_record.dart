import 'package:health_connect/domain/interval_record.dart';
import 'package:health_connect/domain/record.dart';

class StepsRecord extends IntervalRecord {
  final int count;

  StepsRecord(
      {required super.metadata,
      required super.startTime,
      required super.endTime,
      required this.count});

  factory StepsRecord.fromJson(Map<String, dynamic> json) {
    final intervalRecord = IntervalRecord.fromJson(json);
    return StepsRecord(
        metadata: intervalRecord.metadata,
        startTime: intervalRecord.startTime,
        endTime: intervalRecord.endTime,
        count: 1);
  }
}
