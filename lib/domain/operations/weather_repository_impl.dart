import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherLocalDatasource localDatasource;

  WeatherRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<WeatherBusiness?> getWeather() async {
    final result = await localDatasource.getWeather();

    return result?.toLocal();
  }

  @override
  Future<void> saveWeather(WeatherBusiness weather) =>
      localDatasource.saveWeather(weather.local);
}
