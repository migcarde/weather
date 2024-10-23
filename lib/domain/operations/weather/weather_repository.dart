import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherBusiness?> getWeatherFromLocal();
  Future<void> saveWeather(WeatherBusiness weather);
  Future<Result<WeatherEntity>> getWeatherFromRemote({
    required double latitude,
    required double longitude,
  });
}
