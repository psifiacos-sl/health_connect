import 'package:health_connect/domain/record_model/_base/record.dart';

class InstantaneousRecord extends Record {
  // final DateTime date;

  InstantaneousRecord({
    required super.metadata,
    // required this.date,
  });

  factory InstantaneousRecord.fromJson(Map<String, dynamic> json) {
    final record = Record.fromJson(json);
    return InstantaneousRecord(
      metadata: record.metadata,
      // date: json[Constants.time],
    );
  }
}
