import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/ui/home/models/weather_day_view_model.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

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

  WeatherDetailsViewModel get currentWeather =>
      weatherDays.first.weatherData.first;

  List<WeatherDetailsViewModel> get weatherForecast {
    List<WeatherDetailsViewModel> result = [];
    DateTime? firstDate;
    DateTime? breakDate;

    for (final WeatherDayViewModel weatherDay in weatherDays) {
      if (firstDate == null && weatherDay.weatherData.isNotEmpty) {
        firstDate = weatherDay.weatherData.first.time;
        breakDate = firstDate.add(
          const Duration(
            days: 2,
          ),
        );

        result.addAll(weatherDay.weatherData);
      } else {
        final weatherForecast = weatherDay.weatherData
            .where((e) => firstDate!.hour >= e.time.hour)
            .toList();

        result.addAll(weatherForecast);
      }

      if (breakDate != null &&
          firstDate != null &&
          DateUtils.isSameDay(breakDate, weatherDay.date)) {
        break;
      }
    }
    return result;
  }
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
