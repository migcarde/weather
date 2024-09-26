import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/local/weather_local_entity.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/weather_repository_impl.dart';

class WeatherLocalDataSourceMock extends Mock
    implements WeatherLocalDatasource {}

void main() {
  late WeatherLocalDataSourceMock weatherLocalDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(
    () {
      weatherLocalDataSource = WeatherLocalDataSourceMock();
      weatherRepositoryImpl = WeatherRepositoryImpl(
        localDatasource: weatherLocalDataSource,
      );
    },
  );

  group(
    'Get weather -',
    () {
      final successResponse = WeatherLocalEntity(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );
      const successResult = WeatherBusiness(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );

      test(
        'Success',
        () async {
          // Given
          when(() => weatherLocalDataSource.getWeather()).thenAnswer(
            (invocation) async => successResponse,
          );

          // When
          final result = await weatherRepositoryImpl.getWeather();

          // Then
          expect(result, successResult);
          verify(() => weatherLocalDataSource.getWeather()).called(1);
        },
      );

      test(
        'Failure',
        () async {
          // Given
          when(() => weatherLocalDataSource.getWeather()).thenThrow(
            Exception(),
          );
          // Then
          expect(() async => weatherRepositoryImpl.getWeather(),
              throwsA(isInstanceOf<Exception>()));
          verify(() => weatherLocalDataSource.getWeather()).called(1);
        },
      );
    },
  );

  group(
    'Save weather -',
    () {
      final successResponse = WeatherLocalEntity(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );
      const successResult = WeatherBusiness(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );

      test(
        'Success',
        () async {
          // Given
          when(() => weatherLocalDataSource.saveWeather(successResponse))
              .thenAnswer(
            (invocation) async {},
          );
          // Then
          expect(
              () async =>
                  await weatherRepositoryImpl.saveWeather(successResult),
              isA<void>());
        },
      );

      test(
        'Failure',
        () async {
          // Given
          when(() => weatherLocalDataSource.saveWeather(successResponse))
              .thenThrow(
            Exception(),
          );
          // Then
          expect(() async => weatherRepositoryImpl.saveWeather(successResult),
              throwsA(isInstanceOf<Exception>()));
        },
      );
    },
  );
}
