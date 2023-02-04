import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class StepsCadenceRecord extends IntervalRecord {
  final List<StepsCadenceRecordSample> samples;

  StepsCadenceRecord(
      {required this.samples,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory StepsCadenceRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return StepsCadenceRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => StepsCadenceRecordSample.fromJson(e))
            .toList());
  }
}

class StepsCadenceRecordSample {
  final DataNoUnit dataNoUnit;
  final int? time;

  StepsCadenceRecordSample({required this.dataNoUnit, this.time});

  factory StepsCadenceRecordSample.fromJson(Map<String, dynamic> json) {
    return StepsCadenceRecordSample(
        dataNoUnit: DataNoUnit(json[Constants.rate]),
        time: json[Constants.time]);
  }
}
