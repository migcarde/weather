import 'package:weather/data/local/weather_local_entity.dart';

abstract class WeatherLocalDatasource {
  Future<WeatherLocalEntity?> getWeather();
  Future<void> saveWeather(WeatherLocalEntity weather);
}
