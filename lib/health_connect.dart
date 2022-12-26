import 'package:health_connect/domain/ReadRecordResponse.dart';
import 'package:health_connect/domain/record.dart';
import 'package:health_connect/enums.dart';

import 'health_connect_platform_interface.dart';

class HealthConnect {
  static final HealthConnect _singleton = HealthConnect._internal();

  factory HealthConnect() {
    return _singleton;
  }

  HealthConnect._internal();

  Future<String?> getPlatformVersion() {
    return HealthConnectPlatform.instance.getPlatformVersion();
  }

  Future<List<RecordClass>> requestPermissions(
      List<RecordClass> permissions) async {
    final list =
        await HealthConnectPlatform.instance.requestPermissions(permissions);
    return list;
  }

  Future<ReadRecordResponse> readData(RecordClass recordClass) async {
    final result = await HealthConnectPlatform.instance.readData(recordClass);
    return result;
  }
}
