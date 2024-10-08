import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';

class GetWeatherFromLocal extends BaseUseCase<WeatherBusiness?, NoParams> {
  final WeatherRepository repository;

  GetWeatherFromLocal({required this.repository});

  @override
  Future<WeatherBusiness?> call(NoParams params) =>
      repository.getWeatherFromLocal();
}
