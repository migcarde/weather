import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/weather_repository.dart';

class SaveWeather extends BaseUseCase<void, WeatherBusiness> {
  final WeatherRepository weatherRepository;

  SaveWeather({
    required this.weatherRepository,
  });

  @override
  Future<void> call(WeatherBusiness params) =>
      weatherRepository.saveWeather(params);
}
