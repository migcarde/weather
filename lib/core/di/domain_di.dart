import 'package:weather/core/locator.dart';
import 'package:weather/domain/operations/get_weather.dart';
import 'package:weather/domain/operations/save_weather.dart';
import 'package:weather/domain/operations/weather_repository.dart';
import 'package:weather/domain/operations/weather_repository_impl.dart';

class DomainDi {
  static void init() {
    // Repositories
    locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(
        localDatasource: locator(),
      ),
    );

    // Operations
    locator.registerFactory(
      () => GetWeather(
        repository: locator(),
      ),
    );

    locator.registerFactory(
      () => SaveWeather(
        weatherRepository: locator(),
      ),
    );
  }
}
