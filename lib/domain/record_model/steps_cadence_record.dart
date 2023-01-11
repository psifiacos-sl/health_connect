import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class StepsCadenceRecord extends IntervalRecord {
  final List<StepsCadenceRecordSample> samples;

  StepsCadenceRecord({required this.samples, required super.metadata});

  factory StepsCadenceRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return StepsCadenceRecord(
        metadata: parent.metadata,
        samples: (json[Constants.samples] as Iterable)
            .map((e) => StepsCadenceRecordSample.fromJson(e))
            .toList());
  }
}

class StepsCadenceRecordSample {
  final double rate;

  StepsCadenceRecordSample({required this.rate});

  factory StepsCadenceRecordSample.fromJson(Map<String, dynamic> json) {
    return StepsCadenceRecordSample(rate: json[Constants.rate]);
  }
}
