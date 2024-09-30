import 'package:weather/domain/models/weather_business.dart';

abstract class WeatherRepository {
  Future<WeatherBusiness?> getWeather();
  Future<void> saveWeather(WeatherBusiness weather);
}
