import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/main_remote_entity.dart';

class MainEntity extends Equatable {
  final double temperature;
  final double temperatureFeeling;
  final double minTemperature;
  final double maxTemperature;
  final int pressure;
  final int seaLevel;
  final int groundLevel;
  final int humidity;
  final double temperatureKf;

  const MainEntity({
    required this.temperature,
    required this.temperatureFeeling,
    required this.minTemperature,
    required this.maxTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.groundLevel,
    required this.humidity,
    required this.temperatureKf,
  });

  @override
  List<Object?> get props => [
        temperature,
        temperatureFeeling,
        minTemperature,
        maxTemperature,
        pressure,
        seaLevel,
        groundLevel,
        humidity,
        temperatureKf,
      ];
}

extension MainRemoteEntityExtensions on MainRemoteEntity {
  MainEntity toEntity() => MainEntity(
        temperature: temp ?? 0.0,
        temperatureFeeling: feelsLike ?? 0.0,
        minTemperature: tempMin ?? 0.0,
        maxTemperature: tempMax ?? 0.0,
        pressure: pressure ?? 0,
        seaLevel: seaLevel ?? 0,
        groundLevel: grndLevel ?? 0,
        humidity: humidity ?? 0,
        temperatureKf: tempKf ?? 0.0,
      );
}
