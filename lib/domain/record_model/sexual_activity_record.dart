import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class SexualActivityRecord extends InstantaneousRecord {
  final DataNoUnit protectionUsed;

  SexualActivityRecord(
      {required this.protectionUsed,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory SexualActivityRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return SexualActivityRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        protectionUsed: DataNoUnit(Protections.values
            .firstWhere(
                (element) => element.name == json[Constants.protectionUsed],
                orElse: () => Protections.PROTECTION_USED_UNKNOWN)
            .index));
  }
}
