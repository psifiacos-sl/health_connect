import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:health_connect/domain/read_record_response.dart';
import 'package:health_connect/domain/record_model/_base/record.dart';
import 'package:health_connect/domain/record_model/heart_rate_record.dart';
import 'package:health_connect/enums.dart';
import 'package:health_connect/health_connect.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _healthConnectPlugin = HealthConnect();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _healthConnectPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Text('Running on1111: $_platformVersion\n'),
            ElevatedButton(
                onPressed: () async {
                  isProviderAvailable();
                },
                child: Text("Provider Available")),
            ElevatedButton(
                onPressed: () async {
                  checkPermissions();
                },
                child: Text("Check")),
            ElevatedButton(
                onPressed: () async {
                  requestPermissions();
                },
                child: Text("Request")),
            ElevatedButton(
                onPressed: () async {
                  readMultiple();
                },
                child: Text("Read")),
            ElevatedButton(
                onPressed: () async {
                  writeData();
                },
                child: Text("Write"))
          ],
        ),
      ),
    );
  }

  void isProviderAvailable() async {
    final status = await _healthConnectPlugin.isProviderAvailable();
    print(status.toString());
  }

  void checkPermissions() async {
    final permissions =
        await _healthConnectPlugin.checkPermissions(RecordClass.values);
    print(permissions.toString());
  }

  void requestPermissions() async {
    final permissions =
        await _healthConnectPlugin.requestPermissions(RecordClass.values);
    if (permissions.isEmpty) {}
    print(permissions.toString());
  }

  void readMultiple() async {
    final futures = [
      RecordClass.TotalCaloriesBurnedRead,
      RecordClass.SpeedSeriesRead,
      RecordClass.HeartRateSeriesRead,
      RecordClass.DistanceRead,
      RecordClass.ActivitySessionRead,
      RecordClass.CyclingPedalingCadenceSeriesRead
    ]
        .where((element) => element.name.endsWith("Read"))
        .map((e) => readData(e))
        .toList();
    final res = await Future.wait(futures);
    final List<ReadRecordResponse> toSave = [];
    for (var r in res) {
      toSave.add(r);
    }
    print(toSave.length);
  }

  Future<ReadRecordResponse> readData(RecordClass rc) async {
    final st = DateTime.now().subtract(Duration(days: 1));
    final et = DateTime.now().add(Duration(days: 365));
    final data = await _healthConnectPlugin.readData(rc,
        startTime: st.millisecondsSinceEpoch,
        endTime: et.millisecondsSinceEpoch);
    return data;
  }

  void writeData() async {
    await _healthConnectPlugin.writeData();
    print("OK");
  }
}
