import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';

class RestingHeartRateRecord extends InstantaneousRecord {
  final DataNoUnit dataNoUnit;

  RestingHeartRateRecord(
      {required this.dataNoUnit,
      required super.metadata,
      super.time,
      super.zoneOffset});

  factory RestingHeartRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return RestingHeartRateRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        dataNoUnit: DataNoUnit(json[Constants.beatsPerMinute],
            customUnit: Constants.beatsPerMinute));
  }
}
