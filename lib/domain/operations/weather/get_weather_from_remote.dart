import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/domain/operations/weather/params/get_weather_from_remote_params.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';

class GetWeatherFromRemote
    extends BaseUseCase<Result<WeatherEntity>, GetWeatherFromRemoteParams> {
  final WeatherRepository repository;

  GetWeatherFromRemote({
    required this.repository,
  });

  @override
  Future<Result<WeatherEntity>> call(GetWeatherFromRemoteParams params) =>
      repository.getWeatherFromRemote(
        latitude: params.latitude,
        longitude: params.longitude,
      );
}
