import 'package:hive/hive.dart';
import 'package:weather/core/extensions/hive_extensions.dart';
import 'package:weather/core/services/logger_service.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/local/weather_local_entity.dart';

class WeatherLocalDatasourceImpl extends WeatherLocalDatasource {
  static const _boxName = 'weatherBox';

  final HiveInterface hive;

  WeatherLocalDatasourceImpl({
    required this.hive,
  });

  @override
  Future<WeatherLocalEntity?> getWeather() async {
    try {
      final box = await hive.getBox<WeatherLocalEntity>(_boxName);
      final result = box.values.first;
      box.close();

      return result;
    } catch (e) {
      logger.error(e.toString());

      return null;
    }
  }

  @override
  Future<void> saveWeather(WeatherLocalEntity weather) async {
    try {
      final box = await hive.getBox<WeatherLocalEntity>(_boxName);

      await box.clear();
      await box.add(weather);
      box.close();
    } catch (e) {
      logger.error(e.toString());
    }
  }
}
