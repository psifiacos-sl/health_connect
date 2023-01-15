import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class FloorsClimbedRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  FloorsClimbedRecord({required this.dataNoUnit, required super.metadata});

  factory FloorsClimbedRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return FloorsClimbedRecord(
        dataNoUnit: DataNoUnit(json[Constants.floors]),
        metadata: parent.metadata);
  }
}
