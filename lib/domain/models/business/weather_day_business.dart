import 'package:equatable/equatable.dart';
import 'package:weather/data/local/weather_day_local_entity.dart';
import 'package:weather/domain/models/business/weather_data_business.dart';

class WeatherDayBusiness extends Equatable {
  final DateTime date;
  final List<WeatherDataBusiness> weatherData;

  const WeatherDayBusiness({
    required this.date,
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        date,
        weatherData,
      ];

  WeatherDayLocalEntity get local => WeatherDayLocalEntity(
        date: date,
        weatherData: weatherData.map((e) => e.local).toList(),
      );
}

extension WeatherDayLocalEntityExtensions on WeatherDayLocalEntity {
  WeatherDayBusiness toBusiness() => WeatherDayBusiness(
        date: date,
        weatherData: weatherData.map((e) => e.toBusiness()).toList(),
      );
}
