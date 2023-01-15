import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class ExerciseRepetitionsRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  ExerciseRepetitionsRecord(
      {required this.dataNoUnit, required super.metadata});

  factory ExerciseRepetitionsRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseRepetitionsRecord(
      metadata: parent.metadata,
      dataNoUnit: DataNoUnit(json[Constants.count]),
    );
  }
}
