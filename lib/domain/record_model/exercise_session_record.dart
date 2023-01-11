import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class ExerciseSessionRecord extends IntervalRecord {
  final String? notes;
  final String? title;

  ExerciseSessionRecord({this.notes, this.title, required super.metadata});

  factory ExerciseSessionRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseSessionRecord(
        title: json[Constants.title],
        notes: json[Constants.notes],
        metadata: parent.metadata);
  }
}
