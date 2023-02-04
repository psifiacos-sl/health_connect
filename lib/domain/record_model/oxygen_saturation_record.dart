import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/percentage_unit.dart';

class OxygenSaturationRecord extends InstantaneousRecord {
  final PercentageUnit percentage;

  OxygenSaturationRecord(
      {required this.percentage,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory OxygenSaturationRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return OxygenSaturationRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        percentage: PercentageUnit.fromJson(json[Constants.percentage]));
  }
}
