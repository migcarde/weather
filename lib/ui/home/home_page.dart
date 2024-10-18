import 'package:flutter/material.dart';
import 'package:weather/ui/current_forecast/current_forecast.dart';
import 'package:weather/ui/current_weather/current_weather.dart';
import 'package:weather/ui/home/models/home_view_model.dart';
import 'package:weather/ui/location/location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.currentForecast,
  });

  final HomeViewModel currentForecast;

  @override
  Widget build(BuildContext context) {
    final currentWeather = currentForecast.currentWeather;
    return Column(
      children: [
        LocationWidget(
          location: currentForecast.locationName,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
          ),
          child: CurrentWeather(
            degrees: currentWeather.temperature.toInt(),
            icon: currentWeather.icon,
            weather: currentWeather.weather,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 34.0,
          ),
          child: CurrentForecast(
            // TODO: Unify today and tomorrow
            weatherDetails: currentForecast.weatherForecast,
          ),
        ),
      ],
    );
  }
}
