import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_details_remote_entity.dart';

class WeatherDetailsEntity extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherDetailsEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

extension WeatherDetailsRemoteEntityExtensions on WeatherDetailsRemoteEntity {
  WeatherDetailsEntity toEntity() => WeatherDetailsEntity(
        id: id ?? -1,
        main: main ?? '',
        description: description ?? '',
        icon: icon ?? '',
      );
}
