import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

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
  final double revolutionsPerMinute;

  CyclingPedalingCadenceRecordSample({required this.revolutionsPerMinute});

  factory CyclingPedalingCadenceRecordSample.fromJson(
      Map<String, dynamic> json) {
    return CyclingPedalingCadenceRecordSample(
        revolutionsPerMinute: json[Constants.revolutionsPerMinute]);
  }
}
