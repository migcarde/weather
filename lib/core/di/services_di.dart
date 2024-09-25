import 'package:weather/core/location_service.dart';
import 'package:weather/core/locator.dart';

class ServicesDi {
  static void init() {
    locator.registerLazySingleton(
      () => LocationService(),
    );
  }
}
