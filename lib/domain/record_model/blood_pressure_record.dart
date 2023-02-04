import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/domain/units/pressure_unit.dart';
import 'package:health_connect/enums.dart';

class BloodPressureRecord extends InstantaneousRecord {
  final PressureUnit systolic, diastolic;
  final DataNoUnit bodyPosition, measurementLocation;

  BloodPressureRecord(
      {required this.systolic,
      required this.diastolic,
      required this.bodyPosition,
      required this.measurementLocation,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory BloodPressureRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BloodPressureRecord(
      metadata: parent.metadata,
      time: parent.time,
      zoneOffset: parent.zoneOffset,
      diastolic: PressureUnit.fromJson(json[Constants.diastolic]),
      systolic: PressureUnit.fromJson(json[Constants.systolic]),
      bodyPosition: DataNoUnit(BodyPositions.values
          .firstWhere((element) => element.name == json[Constants.bodyPosition],
              orElse: () => BodyPositions.BODY_POSITION_UNKNOWN)
          .index),
      measurementLocation: DataNoUnit(MeasurementLocations.values
          .firstWhere(
              (element) => element.name == json[Constants.measurementLocation],
              orElse: () => MeasurementLocations.MEASUREMENT_LOCATION_UNKNOWN)
          .index),
    );
  }
}
