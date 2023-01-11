import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/temperature_unit.dart';

class BodyTemperatureRecord extends InstantaneousRecord {
  final TemperatureUnit temperature;

  BodyTemperatureRecord({required this.temperature, required super.metadata});

  factory BodyTemperatureRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BodyTemperatureRecord(
        metadata: parent.metadata,
        temperature: TemperatureUnit.fromJson(json[Constants.temperature]));
  }
}
