import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class ExerciseRepetitionsRecord extends IntervalRecord {
  final int count;

  ExerciseRepetitionsRecord({required this.count, required super.metadata});

  factory ExerciseRepetitionsRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseRepetitionsRecord(
      metadata: parent.metadata,
      count: json[Constants.count],
    );
  }
}
