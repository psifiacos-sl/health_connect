import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/domain/units/length_unit.dart';

class ExerciseRouteRecord extends IntervalRecord {
  final List<ExerciseRouteRecordSample> samples;

  ExerciseRouteRecord({required this.samples, required super.metadata});

  factory ExerciseRouteRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return ExerciseRouteRecord(
      metadata: parent.metadata,
      samples: (json[Constants.samples] as Iterable)
          .map((e) => ExerciseRouteRecordSample.fromJson(e))
          .toList(),
    );
  }
}

class ExerciseRouteRecordSample {
  final DataNoUnit dataNoUnitLatitude;
  final DataNoUnit dataNoUnitLongitude;
  final LengthUnit horizontalAccuracy, altitude, verticalAccuracy;

  ExerciseRouteRecordSample(
      {required this.dataNoUnitLatitude,
      required this.dataNoUnitLongitude,
      required this.horizontalAccuracy,
      required this.altitude,
      required this.verticalAccuracy});

  factory ExerciseRouteRecordSample.fromJson(Map<String, dynamic> json) {
    return ExerciseRouteRecordSample(
      dataNoUnitLatitude: DataNoUnit(json[Constants.latitude] ?? 0.0),
      dataNoUnitLongitude: DataNoUnit(json[Constants.longitude] ?? 0.0),
      horizontalAccuracy: json[Constants.horizontalAccuracy] != null
          ? LengthUnit.fromJson(json[Constants.horizontalAccuracy])
          : LengthUnit.defValue,
      altitude: json[Constants.altitude] != null
          ? LengthUnit.fromJson(json[Constants.altitude])
          : LengthUnit.defValue,
      verticalAccuracy: json[Constants.verticalAccuracy] != null
          ? LengthUnit.fromJson(json[Constants.verticalAccuracy])
          : LengthUnit.defValue,
    );
  }
}
