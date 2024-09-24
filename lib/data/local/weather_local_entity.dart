import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather/data/local/local_types_ids.dart';

@HiveType(typeId: LocalTypesIds.weatherTypeId)
class WeatherLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;
  @HiveField(2)
  final String locationName;

  WeatherLocalEntity({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        locationName,
      ];
}
