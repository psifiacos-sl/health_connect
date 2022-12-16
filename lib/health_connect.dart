
import 'health_connect_platform_interface.dart';

class HealthConnect {
  Future<String?> getPlatformVersion() {
    return HealthConnectPlatform.instance.getPlatformVersion();
  }
}
