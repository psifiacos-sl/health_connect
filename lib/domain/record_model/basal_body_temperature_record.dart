import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/temperature_unit.dart';

class BasalBodyTemperatureRecord extends InstantaneousRecord {
  final TemperatureUnit temperature;

  BasalBodyTemperatureRecord(
      {required this.temperature,
      required super.metadata,
      super.time,
      super.zoneOffset});

  factory BasalBodyTemperatureRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BasalBodyTemperatureRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        temperature: TemperatureUnit.fromJson(json[Constants.temperature]));
  }
}
