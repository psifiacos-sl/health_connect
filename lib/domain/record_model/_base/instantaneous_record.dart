import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/record.dart';

class InstantaneousRecord extends Record {
  final int time;
  final int? zoneOffset;

  InstantaneousRecord({required super.metadata, required this.time, this.zoneOffset});

  factory InstantaneousRecord.fromJson(Map<String, dynamic>? json) {
    final record = Record.fromJson(json);
    return InstantaneousRecord(
        metadata: record.metadata,
        time: json?[Constants.time],
        zoneOffset: json?[Constants.zoneOffset ]);
  }
}
