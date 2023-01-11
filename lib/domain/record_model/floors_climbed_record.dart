import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class FloorsClimbedRecord extends IntervalRecord {
  final double floors;

  FloorsClimbedRecord({required this.floors, required super.metadata});

  factory FloorsClimbedRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return FloorsClimbedRecord(
        floors: json[Constants.floors], metadata: parent.metadata);
  }
}
