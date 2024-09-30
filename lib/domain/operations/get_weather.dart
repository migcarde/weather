import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/weather_repository.dart';

class GetWeather extends BaseUseCase<WeatherBusiness?, NoParams> {
  final WeatherRepository repository;

  GetWeather({required this.repository});

  @override
  Future<WeatherBusiness?> call(NoParams params) => repository.getWeather();
}
