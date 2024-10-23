import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_remote_entity.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _WeatherApi;

  @GET('data/2.5/forecast')
  Future<WeatherRemoteEntity> getCurrentWeather({
    @Query('lat') required double latitude,
    @Query('lon') required double longitude,
    @Query('apiKey') required String apiKey,
    @Query('units') String? units,
  });
}
