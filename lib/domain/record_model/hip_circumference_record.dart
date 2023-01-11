import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/length_unit.dart';

class HipCircumferenceRecord extends InstantaneousRecord {
  final LengthUnit circumference;

  HipCircumferenceRecord(
      {required this.circumference, required super.metadata});

  factory HipCircumferenceRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return HipCircumferenceRecord(
        metadata: parent.metadata,
        circumference: LengthUnit.fromJson(json[Constants.circumference]));
  }
  
}
