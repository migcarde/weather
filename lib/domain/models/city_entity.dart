import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/city_remote_entity.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String country;
  final int population;
  final int timezone;
  final DateTime sunrise;
  final DateTime sunset;

  const CityEntity({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        latitude,
        longitude,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}

extension CityRemoteEntityExtensions on CityRemoteEntity {
  CityEntity toEntity() => CityEntity(
        id: id ?? -1,
        name: name ?? '',
        latitude: coord?.lat ?? 0.0,
        longitude: coord?.lon ?? 0.0,
        country: country ?? '',
        population: population ?? 0,
        timezone: timezone ?? 0,
        sunrise: DateTime.fromMillisecondsSinceEpoch(sunrise ?? 0 * 1000),
        sunset: DateTime.fromMillisecondsSinceEpoch(sunset ?? 0 * 1000),
      );
}
