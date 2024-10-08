import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_remote_entity.dart';
import 'package:weather/domain/models/city_entity.dart';
import 'package:weather/domain/models/weather_data_entity.dart';

class WeatherEntity extends Equatable {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherDataEntity> details;
  final CityEntity? city;

  const WeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.details,
    required this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        details,
        city,
      ];
}

extension WeatherRemoteEntityExtensions on WeatherRemoteEntity {
  WeatherEntity toEntity() => WeatherEntity(
        cod: cod ?? '',
        message: message ?? -1,
        cnt: cnt ?? -1,
        details: list?.map((e) => e.toEntity()).toList() ?? [],
        city: city?.toEntity(),
      );
}
