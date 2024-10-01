import 'package:hive/hive.dart';
import 'package:weather/core/locator.dart';
import 'package:weather/core/network/client.dart';
import 'package:weather/core/network/interceptors/response_interceptor.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/local/weather_local_datasource_impl.dart';

class DataDi {
  static void init() {
    // Local
    locator.registerLazySingleton(() => Hive);

    locator.registerLazySingleton<WeatherLocalDatasource>(
      () => WeatherLocalDatasourceImpl(
        hive: locator(),
      ),
    );

    // Remote
    locator.registerLazySingleton(() {
      final client = Client();
      client.configureInterceptors(
        [
          ResponseInterceptor(),
        ],
      );

      return client.dio;
    });
  }
}
