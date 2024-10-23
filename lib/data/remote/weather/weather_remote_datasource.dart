import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_remote_entity.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherRemoteEntity> getCurrentWeather({
    required double latitude,
    required double longitude,
    String? units,
  });
}
