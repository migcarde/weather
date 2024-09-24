import 'package:weather/data/local/weather_local_entity.dart';

class WeatherBusiness {
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
}

extension WeatherLocalEntityExtensions on WeatherLocalEntity {
  WeatherBusiness toLocal() => WeatherBusiness(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );
}
