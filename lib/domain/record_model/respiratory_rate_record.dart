import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class RespiratoryRateRecord extends IntervalRecord {
  final DataNoUnit rate;

  RespiratoryRateRecord(
      {required this.rate,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory RespiratoryRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return RespiratoryRateRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        rate: DataNoUnit(json[Constants.rate],
            customUnit: Constants.breathsPerMinute));
  }
}
