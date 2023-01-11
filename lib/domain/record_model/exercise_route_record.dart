import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
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
  final double latitude;
  final double longitude;
  final LengthUnit? horizontalAccuracy, altitude, verticalAccuracy;

  ExerciseRouteRecordSample(
      {required this.latitude,
      required this.longitude,
      this.horizontalAccuracy,
      this.altitude,
      this.verticalAccuracy});

  factory ExerciseRouteRecordSample.fromJson(Map<String, dynamic> json) {
    return ExerciseRouteRecordSample(
      latitude: json[Constants.latitude],
      longitude: json[Constants.longitude],
      horizontalAccuracy:
          LengthUnit.fromJson(json[Constants.horizontalAccuracy]),
      altitude: LengthUnit.fromJson(json[Constants.altitude]),
      verticalAccuracy: LengthUnit.fromJson(json[Constants.verticalAccuracy]),
    );
  }
}
