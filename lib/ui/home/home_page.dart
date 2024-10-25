import 'package:flutter/material.dart';
import 'package:weather/ui/current_forecast/current_forecast.dart';
import 'package:weather/ui/current_weather/current_weather.dart';
import 'package:weather/ui/home/models/home_view_model.dart';
import 'package:weather/ui/location/location_widget.dart';
import 'package:weather/ui/weekly_weather/weekly_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.currentForecast,
  });

  final HomeViewModel currentForecast;

  static const _currentWeatherPaddingTop = 60.0;
  static const _currentForecastPaddingTop = 34.0;

  @override
  Widget build(BuildContext context) {
    final currentWeather = currentForecast.currentWeather;
    return SingleChildScrollView(
      child: Column(
        children: [
          LocationWidget(
            location: currentForecast.locationName,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: _currentWeatherPaddingTop,
            ),
            child: CurrentWeather(
              degrees: currentWeather.temperature.toInt(),
              icon: currentWeather.icon,
              weather: currentWeather.weather,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: _currentForecastPaddingTop,
            ),
            child: CurrentForecast(
              // TODO: Unify today and tomorrow
              weatherDetails: currentForecast.weatherForecast,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 34.0,
            ),
            child: WeeklyWeather(
              weeklyWeather: currentForecast.weatherDays
                  .map((element) => element.weeklyWeather)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
