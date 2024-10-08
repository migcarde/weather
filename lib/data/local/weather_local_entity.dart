import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather/data/local/local_types_ids.dart';
import 'package:weather/data/local/weather_day_local_entity.dart';

part 'weather_local_entity.g.dart';

@HiveType(typeId: LocalTypesIds.weatherTypeId)
class WeatherLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final String locationName;

  @HiveField(3)
  final DateTime? sunrise;

  @HiveField(4)
  final DateTime? sunset;

  @HiveField(5)
  final List<WeatherDayLocalEntity> weatherDays;

  WeatherLocalEntity({
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
}
