import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class SleepSessionRecord extends IntervalRecord {
  final String? notes;
  final String? title;

  SleepSessionRecord({this.notes, this.title, required super.metadata});

  factory SleepSessionRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return SleepSessionRecord(
      metadata: parent.metadata,
      title: json[Constants.title],
      notes: json[Constants.notes],
    );
  }
}
