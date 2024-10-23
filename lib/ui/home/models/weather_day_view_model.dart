import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/business/weather_day_business.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

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
}

extension WeatherDayBusinessExtensions on WeatherDayBusiness {
  WeatherDayViewModel toBusiness() => WeatherDayViewModel(
        date: date,
        weatherData: weatherData.map((e) => e.toViewModel()).toList(),
      );
}
