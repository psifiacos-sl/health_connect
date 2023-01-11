import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class StepsRecord extends IntervalRecord {
  final int count;

  StepsRecord(
      {required super.metadata,
      // required super.startTime,
      // required super.endTime,
      required this.count});

  factory StepsRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return StepsRecord(
        metadata: parent.metadata,
        // startTime: parent.startTime,
        // endTime: parent.endTime,
        count: json[Constants.count]);
  }
}
