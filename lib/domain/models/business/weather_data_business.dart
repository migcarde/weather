import 'package:equatable/equatable.dart';
import 'package:weather/data/local/weather_details_local_entity.dart';

class WeatherDataBusiness extends Equatable {
  final DateTime time;
  final double temperature;
  final List<int> icon;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int clouds;
  final double windSpeed;
  final double precipitation;
  final int visibility;
  final String weather;

  const WeatherDataBusiness({
    required this.time,
    required this.temperature,
    required this.icon,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.clouds,
    required this.windSpeed,
    required this.precipitation,
    required this.visibility,
    required this.weather,
  });

  @override
  List<Object?> get props => [
        time,
        temperature,
        icon,
        maxTemperature,
        minTemperature,
        pressure,
        clouds,
        windSpeed,
        precipitation,
        visibility,
        weather,
      ];

  WeatherDetailsLocalEntity get local => WeatherDetailsLocalEntity(
        time: time,
        icon: icon,
        precipitation: precipitation,
        clouds: clouds,
        visibility: visibility,
        windSpeed: windSpeed,
        pressure: pressure,
        minTemperature: minTemperature,
        maxTemperature: maxTemperature,
        temperature: temperature,
        weather: weather,
      );
}

extension WeatherDataLocalEntityExtensions on WeatherDetailsLocalEntity {
  WeatherDataBusiness toBusiness() => WeatherDataBusiness(
        time: time,
        temperature: temperature,
        icon: icon,
        maxTemperature: maxTemperature,
        minTemperature: minTemperature,
        pressure: pressure,
        clouds: clouds,
        windSpeed: windSpeed,
        precipitation: precipitation,
        visibility: visibility,
        weather: weather,
      );
}
