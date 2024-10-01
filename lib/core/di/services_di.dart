import 'package:weather/core/locator.dart';
import 'package:weather/core/services/location_service.dart';

class ServicesDi {
  static void init() {
    locator.registerLazySingleton(
      () => LocationService(),
    );
  }
}
