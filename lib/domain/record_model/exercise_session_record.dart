import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class ExerciseSessionRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  ExerciseSessionRecord({required this.dataNoUnit, required super.metadata});

  factory ExerciseSessionRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseSessionRecord(
        dataNoUnit: DataNoUnit(ExerciseType.values
            .firstWhere(
                (element) => element.name == json[Constants.exerciseType])
            .index),
        metadata: parent.metadata);
  }
}
