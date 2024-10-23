import 'package:weather/core/locator.dart';
import 'package:weather/domain/operations/icons/get_icon.dart';
import 'package:weather/domain/operations/icons/icon_repository.dart';
import 'package:weather/domain/operations/icons/icon_repository_impl.dart';
import 'package:weather/domain/operations/weather/get_weather_from_local.dart';
import 'package:weather/domain/operations/weather/get_weather_from_remote.dart';
import 'package:weather/domain/operations/weather/save_weather.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';
import 'package:weather/domain/operations/weather/weather_repository_impl.dart';

class DomainDi {
  static void init() {
    // Repositories
    locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(
        localDatasource: locator(),
        remoteDatasource: locator(),
      ),
    );

    locator.registerLazySingleton<IconRepository>(
      () => IconRepositoryImpl(
        iconsRemoteDatasource: locator(),
        iconLocalDatasource: locator(),
      ),
    );

    // Operations
    locator.registerFactory(
      () => GetWeatherFromLocal(
        repository: locator(),
      ),
    );

    locator.registerFactory(
      () => GetWeatherFromRemote(
        repository: locator(),
      ),
    );

    locator.registerFactory(
      () => SaveWeather(
        weatherRepository: locator(),
      ),
    );

    locator.registerFactory(
      () => GetIcon(
        iconRepository: locator(),
      ),
    );
  }
}
