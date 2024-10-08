import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/list_remote_entity.dart';

class WeatherHourDetailsBusiness extends Equatable {
  final DateTime time;
  final double rain;
  final double degrees;
  final int iconId;
  final double feelTemperature;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int visibility;
  final double minTemperature;
  final double maxTemperature;

  const WeatherHourDetailsBusiness({
    required this.time,
    required this.rain,
    required this.degrees,
    required this.iconId,
    required this.feelTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.minTemperature,
    required this.maxTemperature,
  });

  @override
  List<Object?> get props => [
        time,
        rain,
        degrees,
        iconId,
        feelTemperature,
        humidity,
        windSpeed,
        pressure,
        visibility,
        maxTemperature,
        minTemperature,
      ];

  factory WeatherHourDetailsBusiness.fromRemoteEntity({
    required ListRemoteEntity remote,
    required int iconId,
  }) =>
      WeatherHourDetailsBusiness(
        time: remote.dt != null
            ? DateTime.fromMillisecondsSinceEpoch(remote.dt! * 1000)
            : DateTime.now(),
        rain: remote.rain?.precipitation ?? 0.0,
        degrees: remote.main?.temp ?? 0.0,
        iconId: iconId,
        feelTemperature: remote.main?.feelsLike ?? 0.0,
        humidity: remote.main?.humidity ?? 0,
        windSpeed: remote.wind?.speed ?? 0.0,
        pressure: remote.main?.pressure ?? 0,
        visibility: remote.visibility ?? 0,
        minTemperature: remote.main?.tempMin ?? 0.0,
        maxTemperature: remote.main?.tempMax ?? 0.0,
      );
}
