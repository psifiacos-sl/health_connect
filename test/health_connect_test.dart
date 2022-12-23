import 'package:flutter_test/flutter_test.dart';
import 'package:health_connect/domain/ReadRecordResponse.dart';
import 'package:health_connect/domain/record.dart';
import 'package:health_connect/enums.dart';
import 'package:health_connect/health_connect.dart';
import 'package:health_connect/health_connect_platform_interface.dart';
import 'package:health_connect/health_connect_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHealthConnectPlatform
    with MockPlatformInterfaceMixin
    implements HealthConnectPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Record> getRecord() {
    // TODO: implement getRecord
    throw UnimplementedError();
  }

  @override
  Future<bool> permissionsGranted() {
    // TODO: implement permissionsGranted
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthorized(RecordClass recordClass) {
    // TODO: implement isAuthorized
    throw UnimplementedError();
  }

  @override
  Future<ReadRecordResponse> readData(RecordClass recordClass) {
    // TODO: implement readData
    throw UnimplementedError();
  }

  @override
  Future<List<RecordClass>> requestPermissions(List<RecordClass> permissions) {
    // TODO: implement requestPermissions
    throw UnimplementedError();
  }
}

void main() {
  final HealthConnectPlatform initialPlatform = HealthConnectPlatform.instance;

  test('$MethodChannelHealthConnect is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHealthConnect>());
  });

  test('getPlatformVersion', () async {
    HealthConnect healthConnectPlugin = HealthConnect();
    MockHealthConnectPlatform fakePlatform = MockHealthConnectPlatform();
    HealthConnectPlatform.instance = fakePlatform;

    expect(await healthConnectPlugin.getPlatformVersion(), '42');
  });
}
