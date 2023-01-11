import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/read_record_response.dart';
import 'package:health_connect/domain/record_mapper.dart';
import 'package:health_connect/domain/record_response_model.dart';
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
  Future<ReadResponse> readData(
      RecordClass recordClass, int startTime, int endTime) async {
    assert(recordClass.name.toLowerCase().endsWith("read"));
    final result = await methodChannel.invokeMethod(Constants.readData, {
      Constants.recordClassArgKey: recordClass.name,
      Constants.startTime: startTime,
      Constants.endTime: endTime
    }).onError((error, stackTrace) {
      return ReadResponse.error(
          error: ReadRecordError(code: 1, message: error.toString()));
    });
    final resultJson = jsonDecode(result);
    final records = (resultJson[Constants.records] as Iterable).isNotEmpty
        ? (resultJson[Constants.records] as Iterable)
        : [];
    final readResponseResult = ReadResponse.success<RecordResponseModel>(
        value: RecordResponseModel(
            pageToken: resultJson[Constants.pageToken],
            records: records
                .map((e) => RecordMapper.getRecordMapper(recordClass, e))
                .toList()));
    return readResponseResult;
  }

  @override
  Future<HealthConnectStatus> isProviderAvailable() async {
    final String? result = await methodChannel
        .invokeMethod<String>(Constants.isProviderAvailable)
        .onError((error, stackTrace) {
      print(error.toString());
    });
    return HealthConnectStatus.values.firstWhere((element) =>
        element.name == (result?.toString() ?? HealthConnectStatus.UnKnown));
  }

  @override
  Future<void> write() async {
    await methodChannel.invokeMethod(Constants.writeData);
  }
}
