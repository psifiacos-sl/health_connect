
import 'health_connect_platform_interface.dart';

class HealthConnect {
  static final HealthConnect _singleton = HealthConnect._internal();
  factory HealthConnect() {
    return _singleton;
  }
  HealthConnect._internal();

  Future<String?> getPlatformVersion() {
    return HealthConnectPlatform.instance.getPlatformVersion();
  }

  void sample(){

  }

}
