import 'package:flutter_test/flutter_test.dart';
import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/read_record_response.dart';
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
  Future<ReadResponse> readData(RecordClass recordClass, int startTime, int endTime) {
    // TODO: implement readData
    throw UnimplementedError();
  }

  @override
  Future<List<RecordClass>> requestPermissions(List<RecordClass> permissions) {
    // TODO: implement requestPermissions
    throw UnimplementedError();
  }

  @override
  Future<List<RecordClass>> checkPermissions(List<RecordClass> permissions) {
    // TODO: implement checkPermissions
    throw UnimplementedError();
  }

  @override
  Future<HealthConnectStatus> isProviderAvailable() {
    // TODO: implement isProviderAvailable
    throw UnimplementedError();
  }

  @override
  Future<void> write() {
    // TODO: implement write
    throw UnimplementedError();
  }
}

void main() {
  final HealthConnectPlatform initialPlatform = HealthConnectPlatform.instance;

  test('$MethodChannelHealthConnect is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHealthConnect>());
  });

  test(Constants.getPlatformVersion, () async {
    HealthConnect healthConnectPlugin = HealthConnect();
    MockHealthConnectPlatform fakePlatform = MockHealthConnectPlatform();
    HealthConnectPlatform.instance = fakePlatform;

    expect(await healthConnectPlugin.getPlatformVersion(), '42');
  });
}
