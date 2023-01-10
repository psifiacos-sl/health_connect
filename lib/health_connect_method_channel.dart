import 'dart:convert';

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
  static final MethodChannelHealthConnect _singleton =
      MethodChannelHealthConnect._internal();

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
  Future<List<RecordClass>> checkPermissions(
      List<RecordClass> permissions) async {
    final result = await methodChannel.invokeMethod(
        Constants.checkPermissions, {
      Constants.recordClassListArgKey: permissions.map((e) => e.name).toList()
    });
    final decode = jsonDecode(result);
    return [];
  }

  @override
  Future<List<RecordClass>> requestPermissions(
      List<RecordClass> permissions) async {
    final result = await methodChannel.invokeMethod(
        Constants.requestPermissions, {
      Constants.recordClassListArgKey: permissions.map((e) => e.name).toList()
    });
    print(result?.length.toString() ?? "empty");
    return [];
  }

  @override
  Future<ReadRecordResponse> readData(RecordClass recordClass) async {
    final result = await methodChannel.invokeMethod(
        Constants.readData, {Constants.recordClassArgKey: recordClass.name});
    return ReadRecordResponse.error(error: ReadRecordError(code: 1));
  }

  @override
  Future<HealthConnectStatus> isProviderAvailable() async {
    final String? result = await methodChannel
        .invokeMethod<String>(Constants.isProviderAvailable)
        .onError((error, stackTrace) {
    });
    return HealthConnectStatus.values.firstWhere((element) =>
        element.name == (result?.toString() ?? HealthConnectStatus.UnKnown));
  }

  @override
  Future<void> write() async {
    await methodChannel.invokeMethod(Constants.writeData);
  }
}
