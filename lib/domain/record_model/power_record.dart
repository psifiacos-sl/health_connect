import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class PowerRecord extends IntervalRecord {
  final List<PowerRecordSample> samples;

  PowerRecord(
      {required this.samples,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory PowerRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return PowerRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => PowerRecordSample.fromJson(e))
            .toList());
  }
}

class PowerRecordSample {
  final DataNoUnit power;
  final int time;

  PowerRecordSample({required this.power, required this.time});

  factory PowerRecordSample.fromJson(Map<String, dynamic> json) {
    return PowerRecordSample(
        power: DataNoUnit(json[Constants.power]), time: json[Constants.time]);
  }
}
