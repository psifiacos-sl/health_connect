import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class Vo2MaxRecord extends InstantaneousRecord {
  final DataNoUnit vo2MillilitersPerMinuteKilogram, measurementMethod;

  Vo2MaxRecord(
      {required this.vo2MillilitersPerMinuteKilogram,
      required this.measurementMethod,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory Vo2MaxRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return Vo2MaxRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        vo2MillilitersPerMinuteKilogram: DataNoUnit(
            json[Constants.vo2MillilitersPerMinuteKilogram],
            customUnit: Constants.maximalAerobicCapacityInMilliliters),
        measurementMethod: DataNoUnit(MeasurementMethods.values
            .firstWhere(
                (element) => element.name == json[Constants.measurementMethod],
                orElse: () => MeasurementMethods.MEASUREMENT_METHOD_OTHER)
            .index));
  }
}
