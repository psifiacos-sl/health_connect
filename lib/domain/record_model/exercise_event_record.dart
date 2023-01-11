import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class ExerciseEventRecord extends IntervalRecord {
  ExerciseEventRecord({required super.metadata});

  factory ExerciseEventRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseEventRecord(
      metadata: parent.metadata,
    );
  }
}
