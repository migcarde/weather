import 'package:equatable/equatable.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/wind_remote_entity.dart';

class WindEntity extends Equatable {
  final double speed;
  final int degrees;
  final double gust;

  const WindEntity({
    required this.speed,
    required this.degrees,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        degrees,
        gust,
      ];
}

extension WindRemoteEntityExtensions on WindRemoteEntity {
  WindEntity toEntity() => WindEntity(
        speed: speed ?? 0.0,
        degrees: deg ?? 0,
        gust: gust ?? 0.0,
      );
}
