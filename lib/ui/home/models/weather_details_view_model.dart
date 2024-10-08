import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/business/weather_data_business.dart';
import 'package:weather/domain/models/weather_data_entity.dart';

class WeatherDetailsViewModel extends Equatable {
  final DateTime time;
  final List<int> icon;
  final double precipitation;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int pressure;
  final double minTemperature;
  final double maxTemperature;
  final double temperature;

  const WeatherDetailsViewModel({
    required this.time,
    required this.icon,
    required this.precipitation,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.pressure,
    required this.minTemperature,
    required this.maxTemperature,
    required this.temperature,
  });

  @override
  List<Object?> get props => [
        time,
        icon,
        precipitation,
        clouds,
        visibility,
        windSpeed,
        pressure,
        minTemperature,
        maxTemperature,
        temperature,
      ];

  WeatherDataBusiness get business => WeatherDataBusiness(
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
      );
}

extension WeatherDataEntityExtensions on WeatherDataEntity {
  WeatherDetailsViewModel toViewModel({
    required List<int> icon,
  }) =>
      WeatherDetailsViewModel(
        time: date,
        icon: icon,
        precipitation: precipitation,
        clouds: clouds,
        visibility: visibility,
        windSpeed: wind?.speed ?? 0.0,
        pressure: main?.pressure ?? 0,
        minTemperature: main?.minTemperature ?? 0.0,
        maxTemperature: main?.maxTemperature ?? 0.0,
        temperature: main?.temperature ?? 0.0,
      );
}

extension WeatherDataBusinessExtensions on WeatherDataBusiness {
  WeatherDetailsViewModel toViewModel() => WeatherDetailsViewModel(
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
      );
}
