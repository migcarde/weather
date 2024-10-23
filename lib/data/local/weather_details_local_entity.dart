import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather/data/local/local_types_ids.dart';

part 'weather_details_local_entity.g.dart';

@HiveType(typeId: LocalTypesIds.weatherDetailsId)
class WeatherDetailsLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final DateTime time;

  @HiveField(1)
  final Uint8List icon;

  @HiveField(2)
  final double precipitation;

  @HiveField(3)
  final int clouds;

  @HiveField(4)
  final int visibility;

  @HiveField(5)
  final double windSpeed;

  @HiveField(6)
  final int pressure;

  @HiveField(7)
  final double minTemperature;

  @HiveField(8)
  final double maxTemperature;

  @HiveField(9)
  final double temperature;

  @HiveField(10)
  final String weather;

  WeatherDetailsLocalEntity({
    required this.time,
    required this.icon,
    required this.precipitation,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.pressure,
    required this.minTemperature,
    required this.maxTemperature,
    required this.temperature,
    required this.weather,
  });

  @override
  List<Object?> get props => [
        time,
        icon,
        precipitation,
        clouds,
        visibility,
        windSpeed,
        pressure,
        minTemperature,
        maxTemperature,
        temperature,
        weather,
      ];
}
