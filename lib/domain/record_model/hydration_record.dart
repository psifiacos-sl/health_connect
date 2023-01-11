import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/volume_unit.dart';

class HydrationRecord extends IntervalRecord {
  final VolumeUnit volume;

  HydrationRecord({required this.volume, required super.metadata});

  factory HydrationRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return HydrationRecord(
        metadata: parent.metadata,
        volume: VolumeUnit.fromJson(json[Constants.volume]));
  }
}
