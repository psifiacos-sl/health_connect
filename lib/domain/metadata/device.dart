import 'package:health_connect/constants.dart';
import 'package:health_connect/enums.dart';

class Device {
  String? manufacturer;
  String? model;
  DeviceTypes type;

  Device({this.manufacturer, this.model, required this.type});

  factory Device.empty() {
    return Device(type: DeviceTypes.UNKNOWN);
  }

  factory Device.fromJson(Map<String, dynamic>? json) {
    return Device(
        type: DeviceTypes.values.firstWhere(
            (element) => element.index == json?[Constants.type], orElse: () {
          return DeviceTypes.UNKNOWN;
        }),
        manufacturer: json?[Constants.manufacturer],
        model: json?[Constants.model]);
  }
}
