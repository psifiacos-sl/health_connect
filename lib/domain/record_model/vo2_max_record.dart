import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';

class Vo2MaxRecord extends InstantaneousRecord {
  final double vo2MillilitersPerMinuteKilogram;

  Vo2MaxRecord(
      {required this.vo2MillilitersPerMinuteKilogram, required super.metadata});

  factory Vo2MaxRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return Vo2MaxRecord(
        metadata: parent.metadata,
        vo2MillilitersPerMinuteKilogram:
            json[Constants.vo2MillilitersPerMinuteKilogram]);
  }
}
