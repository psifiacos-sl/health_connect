import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/velocity_unit.dart';

class SpeedRecord extends IntervalRecord {
  final List<SpeedRecordSample> samples;

  SpeedRecord({required this.samples, required super.metadata});

  factory SpeedRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return SpeedRecord(
        metadata: parent.metadata,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => SpeedRecordSample.fromJson(e))
            .toList());
  }
}

class SpeedRecordSample {
  final VelocityUnit velocity;
  final int? time;

  SpeedRecordSample({required this.velocity, this.time});

  factory SpeedRecordSample.fromJson(Map<String, dynamic> json) {
    return SpeedRecordSample(
        velocity: VelocityUnit.fromJson(json[Constants.velocity]),
        time: json[Constants.time]);
  }
}
