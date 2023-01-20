import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class CyclingPedalingCadenceRecord extends IntervalRecord {
  // final DateTime time;
  final List<CyclingPedalingCadenceRecordSample> samples;

  CyclingPedalingCadenceRecord(
      {required this.samples,
      // required this.time,
      required super.metadata});

  factory CyclingPedalingCadenceRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return CyclingPedalingCadenceRecord(
        samples: (json[Constants.samples] as Iterable)
            .map((e) => CyclingPedalingCadenceRecordSample.fromJson(e))
            .toList(),
        // time: json[Constants.time],
        metadata: parent.metadata);
  }
}

class CyclingPedalingCadenceRecordSample {
  final DataNoUnit dataNoUnit;

  CyclingPedalingCadenceRecordSample({required this.dataNoUnit});

  factory CyclingPedalingCadenceRecordSample.fromJson(
      Map<String, dynamic> json) {
    return CyclingPedalingCadenceRecordSample(
        dataNoUnit: DataNoUnit(json[Constants.revolutionsPerMinute],
            customUnit: Constants.revolutionsPerMinute));
  }
}
