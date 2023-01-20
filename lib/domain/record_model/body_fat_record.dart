import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/percentage_unit.dart';

class BodyFatRecord extends InstantaneousRecord {
  final PercentageUnit percentage;

  BodyFatRecord({required this.percentage, required super.metadata});

  factory BodyFatRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BodyFatRecord(
        metadata: parent.metadata, percentage: PercentageUnit.fromJson(json[Constants.percentage]));
  }
}
