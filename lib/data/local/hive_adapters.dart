import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/data/local/icon_local_entity.dart';
import 'package:weather/data/local/weather_day_local_entity.dart';
import 'package:weather/data/local/weather_details_local_entity.dart';
import 'package:weather/data/local/weather_local_entity.dart';

class HiveAdapters {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    Hive
      ..registerAdapter(WeatherLocalEntityAdapter())
      ..registerAdapter(IconLocalEntityAdapter())
      ..registerAdapter(WeatherDayLocalEntityAdapter())
      ..registerAdapter(WeatherDetailsLocalEntityAdapter());
  }
}
