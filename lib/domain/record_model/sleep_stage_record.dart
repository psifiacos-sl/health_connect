import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/enums.dart';

class SleepStageRecord extends IntervalRecord {
  final SleepStageTypes stage;

  SleepStageRecord({required this.stage, required super.metadata});

  factory SleepStageRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return SleepStageRecord(
        metadata: parent.metadata,
        stage: SleepStageTypes.values
            .firstWhere((element) => element.name == json[Constants.stage]));
  }
}
