import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class CervicalMucusRecord extends InstantaneousRecord {
  final DataNoUnit appearance, sensation;

  CervicalMucusRecord(
      {required this.appearance,
      required this.sensation,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory CervicalMucusRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return CervicalMucusRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        appearance: DataNoUnit(Appearance.values
            .firstWhere((element) => element.name == json[Constants.appearance],
                orElse: () => Appearance.APPEARANCE_UNKNOWN)
            .index),
        sensation: DataNoUnit(Sensation.values
            .firstWhere((element) => element.name == json[Constants.sensation],
                orElse: () => Sensation.SENSATION_UNKNOWN)
            .index));
  }
}
