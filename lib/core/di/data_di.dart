import 'package:hive/hive.dart';
import 'package:weather/core/locator.dart';
import 'package:weather/core/network/client.dart';
import 'package:weather/core/network/interceptors/response_interceptor.dart';
import 'package:weather/data/local/icon_local_datasource.dart';
import 'package:weather/data/local/icon_local_datasource_impl.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/local/weather_local_datasource_impl.dart';
import 'package:weather/data/remote/icons/icons_api.dart';
import 'package:weather/data/remote/icons/icons_remote_datasource.dart';
import 'package:weather/data/remote/icons/icons_remote_datasource_impl.dart';
import 'package:weather/data/remote/weather/weather_api.dart';
import 'package:weather/data/remote/weather/weather_remote_datasource.dart';
import 'package:weather/data/remote/weather/weather_remote_datasource_impl.dart';

class DataDi {
  static void init() {
    // Local
    locator.registerLazySingleton(() => Hive);

    locator.registerLazySingleton<WeatherLocalDatasource>(
      () => WeatherLocalDatasourceImpl(
        hive: locator(),
      ),
    );

    locator.registerLazySingleton<IconLocalDatasource>(
      () => IconLocalDatasourceImpl(
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

    locator.registerLazySingleton(
      () => WeatherApi(
        locator(),
        baseUrl: 'https://api.openweathermap.org/',
      ),
    );

    locator.registerLazySingleton(
      () => IconsApi(
        locator(),
        baseUrl: 'https://openweathermap.org/',
      ),
    );

    locator.registerLazySingleton<WeatherRemoteDatasource>(
      () => WeatherRemoteDatasourceImpl(
        api: locator(),
      ),
    );

    locator.registerLazySingleton<IconsRemoteDatasource>(
      () => IconsRemoteDatasourceImpl(
        api: locator(),
      ),
    );
  }
}
