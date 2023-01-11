import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class HeartRateRecord extends IntervalRecord {
  final List<HeartRateRecordSample> samples;

  HeartRateRecord({required this.samples, required super.metadata});

  factory HeartRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return HeartRateRecord(
        metadata: parent.metadata,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => HeartRateRecordSample.fromJson(e))
            .toList());
  }
}

class HeartRateRecordSample {
  final int beatsPerMinute;

  HeartRateRecordSample({required this.beatsPerMinute});

  factory HeartRateRecordSample.fromJson(Map<String, dynamic> json) {
    return HeartRateRecordSample(
        beatsPerMinute: json[Constants.beatsPerMinute]);
  }
}
