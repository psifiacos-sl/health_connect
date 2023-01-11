import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class WheelchairPushesRecord extends IntervalRecord {
  final int count;

  WheelchairPushesRecord({required this.count, required super.metadata});

  factory WheelchairPushesRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return WheelchairPushesRecord(
        metadata: parent.metadata, count: json[Constants.count]);
  }

}
