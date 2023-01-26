import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class MenstruationFlowRecord extends InstantaneousRecord {
  final DataNoUnit dataNoUnit;

  MenstruationFlowRecord({required this.dataNoUnit, required super.metadata});

  factory MenstruationFlowRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return MenstruationFlowRecord(
        metadata: parent.metadata,
        dataNoUnit: DataNoUnit(MenstruationFlowTypes.values
            .firstWhere((element) => element.name == json[Constants.eventType],
            orElse: () => MenstruationFlowTypes.FLOW_UNKNOWN)
            .index));
  }
}
