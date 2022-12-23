import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/ReadRecordResponse.dart';
import 'package:health_connect/domain/metada.dart';
import 'package:health_connect/domain/record.dart';
import 'package:health_connect/domain/steps_record.dart';
import 'package:health_connect/enums.dart';

import 'health_connect_platform_interface.dart';

/// An implementation of [HealthConnectPlatform] that uses method channels.
class MethodChannelHealthConnect extends HealthConnectPlatform {

  static final MethodChannelHealthConnect _singleton = MethodChannelHealthConnect._internal();
  factory MethodChannelHealthConnect() {
    return _singleton;
  }
  MethodChannelHealthConnect._internal();

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(Constants.methodChannelToAndroid);

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>(Constants.getPlatformVersion);
    return version;
  }

  @override
  Future<List<RecordClass>> requestPermissions(
      List<RecordClass> permissions) async {
    final result = await methodChannel.invokeListMethod(
        Constants.requestPermissions, [RecordClass.StepsRecord]);
    print(result.toString());
    return [];
  }

  @override
  Future<ReadRecordResponse> readData(RecordClass recordClass) async {
    final result =
        await methodChannel.invokeMethod(Constants.readData, [recordClass]);
    return ReadRecordResponse.error(error: ReadRecordError(code: 1));
  }
}
