import 'package:hive/hive.dart';
import 'package:weather/core/extensions/hive_extensions.dart';
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
      final box = await Hive.getBox<WeatherLocalEntity>(_boxName);
      final result = box.values.first;
      box.close();

      return result;
    } catch (e) {
      return null;
    }
  }
}
