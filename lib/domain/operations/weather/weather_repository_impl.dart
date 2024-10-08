import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/remote/weather/weather_remote_datasource.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherLocalDatasource localDatasource;
  final WeatherRemoteDatasource remoteDatasource;

  WeatherRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<WeatherBusiness?> getWeatherFromLocal() async {
    final result = await localDatasource.getWeather();

    return result?.toBusiness();
  }

  @override
  Future<void> saveWeather(WeatherBusiness weather) =>
      localDatasource.saveWeather(weather.local);

  @override
  Future<Result<WeatherEntity>> getWeatherFromRemote({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final result = await remoteDatasource.getCurrentWeather(
        latitude: latitude,
        longitude: longitude,
      );

      return Result.success(
        result.toEntity(),
      );
    } catch (e) {
      return Result.failure(e);
    }
  }
}
