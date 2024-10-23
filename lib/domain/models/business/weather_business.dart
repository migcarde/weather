import 'package:equatable/equatable.dart';
import 'package:weather/data/local/weather_local_entity.dart';
import 'package:weather/domain/models/business/weather_day_business.dart';

class WeatherBusiness extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;
  final DateTime? sunrise;
  final DateTime? sunset;
  final List<WeatherDayBusiness> weatherDays;

  const WeatherBusiness({
    required this.latitude,
    required this.longitude,
    required this.locationName,
    required this.sunrise,
    required this.sunset,
    required this.weatherDays,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        locationName,
        sunrise,
        sunset,
        weatherDays,
      ];

  WeatherLocalEntity get local => WeatherLocalEntity(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
        sunrise: sunrise,
        sunset: sunset,
        weatherDays: weatherDays.map((e) => e.local).toList(),
      );
}

extension WeatherLocalEntityExtensions on WeatherLocalEntity {
  WeatherBusiness toBusiness() => WeatherBusiness(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
        sunrise: sunrise,
        sunset: sunset,
        weatherDays: weatherDays.map((e) => e.toBusiness()).toList(),
      );
}
