import 'package:equatable/equatable.dart';
import 'package:weather/core/extensions/iterable_extensions.dart';
import 'package:weather/domain/models/business/weather_day_business.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';
import 'package:weather/ui/weekly_weather/models/weekly_weather_view_model.dart';

class WeatherDayViewModel extends Equatable {
  final DateTime date;
  final List<WeatherDetailsViewModel> weatherData;

  const WeatherDayViewModel({
    required this.date,
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        date,
        weatherData,
      ];

  WeatherDayViewModel addDay(WeatherDetailsViewModel weatherDetails) =>
      WeatherDayViewModel(
        date: date,
        weatherData: [
          ...weatherData,
          weatherDetails,
        ],
      );

  WeatherDayBusiness get business => WeatherDayBusiness(
        date: date,
        weatherData: weatherData.map((e) => e.business).toList(),
      );

  WeeklyWeatherViewModel get weeklyWeather {
    final maxTemperature = weatherData.fold(
      0.0,
      (previousValue, element) => element.maxTemperature > previousValue
          ? element.maxTemperature
          : previousValue,
    );
    final minTemperature = weatherData.fold(
      weatherData.first.minTemperature,
      (previousValue, element) => element.minTemperature < previousValue
          ? element.minTemperature
          : previousValue,
    );

    return WeeklyWeatherViewModel(
      // Get most repeated icon to show an overall information of the day
      icon: weatherData.mostRepeatedValue.icon,
      date: date,
      minTemperature: minTemperature.toInt(),
      maxTemperature: maxTemperature.toInt(),
    );
  }
}

extension WeatherDayBusinessExtensions on WeatherDayBusiness {
  WeatherDayViewModel toBusiness() => WeatherDayViewModel(
        date: date,
        weatherData: weatherData.map((e) => e.toViewModel()).toList(),
      );
}
