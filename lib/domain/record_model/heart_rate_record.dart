import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class HeartRateRecord extends IntervalRecord {
  final List<HeartRateRecordSample> samples;

  HeartRateRecord(
      {required this.samples,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory HeartRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return HeartRateRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => HeartRateRecordSample.fromJson(e))
            .toList());
  }
}

class HeartRateRecordSample {
  final DataNoUnit beatsPerMinute;
  final int time;

  HeartRateRecordSample({required this.beatsPerMinute, required this.time});

  factory HeartRateRecordSample.fromJson(Map<String, dynamic> json) {
    return HeartRateRecordSample(
        beatsPerMinute: DataNoUnit(json[Constants.beatsPerMinute]),
        time: json[Constants.time]);
  }
}
