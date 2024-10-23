import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather/data/local/local_types_ids.dart';
import 'package:weather/data/local/weather_details_local_entity.dart';

part 'weather_day_local_entity.g.dart';

@HiveType(typeId: LocalTypesIds.weatherDayId)
class WeatherDayLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<WeatherDetailsLocalEntity> weatherData;

  WeatherDayLocalEntity({
    required this.date,
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        date,
        weatherData,
      ];
}
