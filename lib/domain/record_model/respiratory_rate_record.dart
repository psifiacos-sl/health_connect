import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class RespiratoryRateRecord extends IntervalRecord {
  final DataNoUnit dataNoUnit;

  RespiratoryRateRecord({required this.dataNoUnit, required super.metadata});

  factory RespiratoryRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return RespiratoryRateRecord(
        metadata: parent.metadata,
        dataNoUnit: DataNoUnit(json[Constants.rate], customUnit: Constants.breathsPerMinute));
  }
}
