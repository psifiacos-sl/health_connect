import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_connect/constants.dart';
import 'package:health_connect/health_connect_method_channel.dart';

void main() {
  MethodChannelHealthConnect platform = MethodChannelHealthConnect();
  const MethodChannel channel = MethodChannel(Constants.methodChannelToAndroid);

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test(Constants.getPlatformVersion, () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
