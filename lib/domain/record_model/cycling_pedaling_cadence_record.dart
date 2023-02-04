import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class CyclingPedalingCadenceRecord extends IntervalRecord {
  final List<CyclingPedalingCadenceRecordSample> samples;

  CyclingPedalingCadenceRecord(
      {required this.samples,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory CyclingPedalingCadenceRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return CyclingPedalingCadenceRecord(
      samples: (json[Constants.samples] as Iterable)
          .map((e) => CyclingPedalingCadenceRecordSample.fromJson(e))
          .toList(),
      metadata: parent.metadata,
      startTime: parent.startTime,
      endTime: parent.endTime,
      endZoneOffset: parent.endZoneOffset,
      startZoneOffset: parent.startZoneOffset,
    );
  }
}

class CyclingPedalingCadenceRecordSample {
  final DataNoUnit revolutionsPerMinute;
  final int time;

  CyclingPedalingCadenceRecordSample(
      {required this.revolutionsPerMinute, required this.time});

  factory CyclingPedalingCadenceRecordSample.fromJson(
      Map<String, dynamic> json) {
    return CyclingPedalingCadenceRecordSample(
        revolutionsPerMinute: DataNoUnit(json[Constants.revolutionsPerMinute],
            customUnit: Constants.revolutionsPerMinute),
        time: json[Constants.time]);
  }
}
