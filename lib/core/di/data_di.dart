import 'package:hive/hive.dart';
import 'package:weather/core/locator.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/local/weather_local_datasource_impl.dart';

class DataDi {
  static void init() {
    locator.registerLazySingleton(() => Hive);
    locator.registerLazySingleton<WeatherLocalDatasource>(
      () => WeatherLocalDatasourceImpl(
        hive: locator(),
      ),
    );
  }
}
