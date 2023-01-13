import 'package:health_connect/domain/read_record_response.dart';
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

  Future<HealthConnectStatus> isProviderAvailable() async {
    final result = await HealthConnectPlatform.instance.isProviderAvailable();
    return result;
  }

  Future<List<RecordClass>> requestPermissions(
      List<RecordClass> permissions) async {
    final list =
        await HealthConnectPlatform.instance.requestPermissions(permissions);
    return list;
  }

  Future<List<RecordClass>> checkPermissions(
      List<RecordClass> permissions) async {
    final list =
        await HealthConnectPlatform.instance.checkPermissions(permissions);
    return list;
  }

  Future<ReadRecordResponse> readData(
      RecordClass recordClass, {required int startTime, required int endTime}) async {
    final result = await HealthConnectPlatform.instance
        .readData(recordClass, startTime, endTime);
    return result;
  }

  Future<void> writeData() async {
    // final result = await HealthConnectPlatform.instance.write();
    // return result;
  }
}
