import 'package:weather/core/di/cubits_di.dart';
import 'package:weather/core/di/data_di.dart';
import 'package:weather/core/di/domain_di.dart';
import 'package:weather/core/di/services_di.dart';
import 'package:weather/core/locator.dart';

class WeatherDi {
  static Future<void> init() async {
    ServicesDi.init();
    DataDi.init();
    DomainDi.init();
    CubitsDi.init();

    await locator.allReady();
  }
}
