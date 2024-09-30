import 'package:equatable/equatable.dart';
import 'package:weather/data/local/weather_local_entity.dart';

class WeatherBusiness extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;

  const WeatherBusiness({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  WeatherLocalEntity get local => WeatherLocalEntity(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        locationName,
      ];
}

extension WeatherLocalEntityExtensions on WeatherLocalEntity {
  WeatherBusiness toLocal() => WeatherBusiness(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );
}
