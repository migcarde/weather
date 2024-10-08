import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/ui/home/models/weather_day_view_model.dart';

class HomeViewModel extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;
  final DateTime? sunrise;
  final DateTime? sunset;
  final List<WeatherDayViewModel> weatherDays;

  const HomeViewModel({
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

  WeatherBusiness get business => WeatherBusiness(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
        sunrise: sunrise,
        sunset: sunset,
        weatherDays: weatherDays.map((e) => e.business).toList(),
      );
}

extension WeatherBusinessHomeExtensions on WeatherBusiness {
  HomeViewModel toHomeViewModel() => HomeViewModel(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
        sunrise: sunrise,
        sunset: sunset,
        weatherDays: weatherDays.map((e) => e.toBusiness()).toList(),
      );
}

extension WeatherEntityExtensions on WeatherEntity {
  HomeViewModel toHomeViewModel({
    required double latitude,
    required double longitude,
    required String locationName,
    required List<WeatherDayViewModel> weatherDays,
  }) =>
      HomeViewModel(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName,
        sunrise: city?.sunrise,
        sunset: city?.sunset,
        weatherDays: weatherDays,
      );
}
