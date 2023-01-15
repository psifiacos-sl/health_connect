import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class StepsRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  StepsRecord(
      {required super.metadata,
      // required super.startTime,
      // required super.endTime,
      required this.dataNoUnit});

  factory StepsRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return StepsRecord(
        metadata: parent.metadata,
        // startTime: parent.startTime,
        // endTime: parent.endTime,
        dataNoUnit: DataNoUnit(json[Constants.count]));
  }
}
