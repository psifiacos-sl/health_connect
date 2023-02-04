import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/domain/units/temperature_unit.dart';
import 'package:health_connect/enums.dart';

class BodyTemperatureRecord extends InstantaneousRecord {
  final TemperatureUnit temperature;
  final DataNoUnit measurementLocation;

  BodyTemperatureRecord(
      {required this.temperature,
      required this.measurementLocation,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory BodyTemperatureRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BodyTemperatureRecord(
      metadata: parent.metadata,
      time: parent.time,
      zoneOffset: parent.zoneOffset,
      temperature: TemperatureUnit.fromJson(json[Constants.temperature]),
      measurementLocation: DataNoUnit(BodyTemperatureMeasurementLocation.values
          .firstWhere(
              (element) => element.name == json[Constants.measurementLocation],
              orElse: () => BodyTemperatureMeasurementLocation
                  .MEASUREMENT_LOCATION_UNKNOWN)
          .index),
    );
  }
}
