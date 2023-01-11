import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';

class CervicalMucusRecord extends InstantaneousRecord {
  CervicalMucusRecord({required super.metadata});

  factory CervicalMucusRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return CervicalMucusRecord(
      metadata: parent.metadata,
    );
  }
}
