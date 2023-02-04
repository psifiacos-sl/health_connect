import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class OvulationTestRecord extends InstantaneousRecord {
  final DataNoUnit result;

  OvulationTestRecord(
      {required this.result,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory OvulationTestRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return OvulationTestRecord(
        metadata: parent.metadata,
        time: parent.time,
        zoneOffset: parent.zoneOffset,
        result: DataNoUnit(OvulationTest.values
            .firstWhere((element) => element.name == json[Constants.result],
                orElse: () => OvulationTest.RESULT_INCONCLUSIVE)
            .index));
  }
}
