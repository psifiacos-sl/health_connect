import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class Vo2MaxRecord extends InstantaneousRecord {
  final DataNoUnit dataNoUnit;

  Vo2MaxRecord({required this.dataNoUnit, required super.metadata});

  factory Vo2MaxRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return Vo2MaxRecord(
        metadata: parent.metadata,
        dataNoUnit:
            DataNoUnit(json[Constants.vo2MillilitersPerMinuteKilogram]));
  }
}
