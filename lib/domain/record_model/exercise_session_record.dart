import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class ExerciseSessionRecord extends IntervalRecord {
  final DataNoUnit exerciseType;
  final String? title, notes;

  ExerciseSessionRecord(
      {required this.exerciseType,
      this.title,
      this.notes,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory ExerciseSessionRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseSessionRecord(
      exerciseType: DataNoUnit(ExerciseType.values
          .firstWhere((element) => element.name == json[Constants.exerciseType],
              orElse: () => ExerciseType.EXERCISE_TYPE_OTHER_WORKOUT)
          .index),
      title: json[Constants.title],
      notes: json[Constants.notes],
      metadata: parent.metadata,
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
    );
  }
}
