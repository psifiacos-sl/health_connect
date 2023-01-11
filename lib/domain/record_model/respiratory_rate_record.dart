import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';

class RespiratoryRateRecord extends IntervalRecord {
  final double rate;

  RespiratoryRateRecord({required this.rate, required super.metadata});

  factory RespiratoryRateRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return RespiratoryRateRecord(
        metadata: parent.metadata, rate: json[Constants.rate]);
  }
}
