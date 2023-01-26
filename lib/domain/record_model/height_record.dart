import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/length_unit.dart';

class HeightRecord extends InstantaneousRecord {
  final LengthUnit height;

  HeightRecord({required this.height, required super.metadata, super.time,
    super.zoneOffset});

  factory HeightRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return HeightRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        height: LengthUnit.fromJson(json[Constants.height]));
  }
}
