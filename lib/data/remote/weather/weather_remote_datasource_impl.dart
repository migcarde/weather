import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_remote_entity.dart';
import 'package:weather/data/remote/weather/weather_api.dart';
import 'package:weather/data/remote/weather/weather_remote_datasource.dart';

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final WeatherApi api;

  const WeatherRemoteDatasourceImpl({
    required this.api,
  });

  static const _apiKey = String.fromEnvironment('API_KEY');

  @override
  Future<WeatherRemoteEntity> getCurrentWeather({
    required double latitude,
    required double longitude,
    String? units,
  }) async {
    final result = await api.getCurrentWeather(
      latitude: latitude,
      longitude: longitude,
      apiKey: _apiKey,
    );

    return result;
  }
}
