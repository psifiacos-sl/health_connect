import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class ExerciseEventRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  ExerciseEventRecord({required this.dataNoUnit, required super.metadata});

  factory ExerciseEventRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseEventRecord(
        metadata: parent.metadata,
        dataNoUnit: DataNoUnit(ExerciseEventType.values
            .firstWhere((element) => element.name == json[Constants.eventType])
            .index));
  }
}
