import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';

class RestingHeartRateRecord extends InstantaneousRecord {
  final int beatsPerMinute;

  RestingHeartRateRecord(
      {required this.beatsPerMinute, required super.metadata});

  factory RestingHeartRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return RestingHeartRateRecord(
        metadata: parent.metadata,
        beatsPerMinute: json[Constants.beatsPerMinute]);
  }
}
