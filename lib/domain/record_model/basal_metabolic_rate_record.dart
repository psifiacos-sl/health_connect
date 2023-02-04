import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/power_unit.dart';

class BasalMetabolicRateRecord extends InstantaneousRecord {
  final PowerUnit basalMetabolicRate;

  BasalMetabolicRateRecord(
      {required this.basalMetabolicRate,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory BasalMetabolicRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BasalMetabolicRateRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        basalMetabolicRate:
            PowerUnit.fromJson(json[Constants.basalMetabolicRate]));
  }
}
