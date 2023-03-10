import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class SleepStageRecord extends IntervalRecord {
  final DataNoUnit stage;

  SleepStageRecord(
      {required this.stage,
      required super.metadata,
      required super.startTime,
      required super.endTime,
      super.startZoneOffset,
      super.endZoneOffset});

  factory SleepStageRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return SleepStageRecord(
        metadata: parent.metadata,
        startTime: parent.startTime,
        endTime: parent.endTime,
        endZoneOffset: parent.endZoneOffset,
        startZoneOffset: parent.startZoneOffset,
        stage: DataNoUnit(SleepStageTypes.values
            .firstWhere((element) => element.name == json[Constants.stage],
                orElse: () => SleepStageTypes.STAGE_TYPE_UNKNOWN)
            .index));
  }
}
