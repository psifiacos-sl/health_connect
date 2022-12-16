import 'package:flutter_test/flutter_test.dart';
import 'package:health_connect/health_connect.dart';
import 'package:health_connect/health_connect_platform_interface.dart';
import 'package:health_connect/health_connect_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHealthConnectPlatform
    with MockPlatformInterfaceMixin
    implements HealthConnectPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
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
