import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class WheelchairPushesRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  WheelchairPushesRecord({required this.dataNoUnit, required super.metadata});

  factory WheelchairPushesRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return WheelchairPushesRecord(
        metadata: parent.metadata,
        dataNoUnit: DataNoUnit(json[Constants.count]));
  }
}
