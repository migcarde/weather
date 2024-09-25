import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/weather_business.dart';

class HomeViewModel extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;

  const HomeViewModel({
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
}

extension WeatherBusinessHomeExtensions on WeatherBusiness {
  HomeViewModel toHomeViewModel() => HomeViewModel(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
      );
}
