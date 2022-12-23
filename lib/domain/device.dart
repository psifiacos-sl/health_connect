import 'package:health_connect/constants.dart';

class Device {
  String? manufacturer;
  String? model;
  int type;

  Device({this.manufacturer, this.model, required this.type});

  factory Device.empty() {
    return Device(type: -1);
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
        type: json[Constants.type],
        manufacturer: json[Constants.manufacturer],
        model: json[Constants.model]);
  }
}
