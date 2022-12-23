import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/data_origin.dart';
import 'package:health_connect/domain/device.dart';

class Metadata {
  String id;
  DataOrigin dataOrigin;
  DateTime lastModifiedTime;
  int clientRecordVersion;

  String? clientRecordId;
  Device? device;

  Metadata(
      {required this.id,
      required this.dataOrigin,
      required this.lastModifiedTime,
      required this.clientRecordVersion,
      this.clientRecordId,
      this.device});

  factory Metadata.empty() {
    return Metadata(
      id: "",
      dataOrigin: DataOrigin.empty(),
      lastModifiedTime: DateTime(1970),
      clientRecordVersion: -1,
    );
  }

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
        id: json[Constants.id],
        dataOrigin: DataOrigin.fromJson(json[Constants.dataOrigin]),
        lastModifiedTime: json[Constants.lastModifiedTime],
        clientRecordVersion: json[Constants.clientRecordVersion],
        clientRecordId: json[Constants.clientRecordId],
        device: json[Constants.device]);
  }
}
