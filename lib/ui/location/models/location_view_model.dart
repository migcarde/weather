import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/weather_business.dart';

class LocationViewModel extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;

  const LocationViewModel({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        locationName,
      ];

  WeatherBusiness get weatherBusiness => WeatherBusiness(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );
}

extension WeatherBusinessExtensions on WeatherBusiness {
  LocationViewModel toLocationViewModel() => LocationViewModel(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );
}
