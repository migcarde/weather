import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/list_remote_entity.dart';
import 'package:weather/domain/models/main_entity.dart';
import 'package:weather/domain/models/weather_details_entity.dart';
import 'package:weather/domain/models/wind_entity.dart';

class WeatherDataEntity extends Equatable {
  final DateTime date;
  final MainEntity? main;
  final List<WeatherDetailsEntity> details;
  final int clouds;
  final WindEntity? wind;
  final double pop;
  final double precipitation;
  final bool isNight;
  final int visibility;

  const WeatherDataEntity({
    required this.date,
    required this.main,
    required this.details,
    required this.clouds,
    required this.wind,
    required this.pop,
    required this.precipitation,
    required this.isNight,
    required this.visibility,
  });

  @override
  List<Object?> get props => [
        date,
        main,
        details,
        clouds,
        wind,
        pop,
        precipitation,
        isNight,
        visibility,
      ];
}

extension WeatherDataRemoteEntity on ListRemoteEntity {
  WeatherDataEntity toEntity() => WeatherDataEntity(
        date: dt != null
            ? DateTime.fromMillisecondsSinceEpoch(dt! * 1000)
            : DateTime.now(),
        main: main?.toEntity(),
        details: weather
                ?.map(
                  (e) => e.toEntity(),
                )
                .toList() ??
            [],
        clouds: clouds?.all ?? 0,
        wind: wind?.toEntity(),
        pop: pop ?? 0.0,
        precipitation: rain?.precipitation ?? 0.0,
        isNight: sys?.pod == 'n',
        visibility: visibility ?? 0,
      );
}
