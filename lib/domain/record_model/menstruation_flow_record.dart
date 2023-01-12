import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/enums.dart';

class MenstruationFlowRecord extends InstantaneousRecord {
  final MenstruationFlowTypes flow;

  MenstruationFlowRecord({required this.flow, required super.metadata});

  factory MenstruationFlowRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return MenstruationFlowRecord(
        metadata: parent.metadata,
        flow: MenstruationFlowTypes.values
            .firstWhere((element) => element.name == json[Constants.flow]));
  }
}