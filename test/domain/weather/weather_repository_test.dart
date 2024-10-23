import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/local/weather_local_datasource.dart';
import 'package:weather/data/remote/weather/weather_remote_datasource.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/operations/weather/weather_repository_impl.dart';

import 'weather_instruments.dart';

class WeatherLocalDataSourceMock extends Mock
    implements WeatherLocalDatasource {}

class WeatherRemoteDatasourceMock extends Mock
    implements WeatherRemoteDatasource {}

void main() {
  late WeatherLocalDataSourceMock weatherLocalDataSource;
  late WeatherRemoteDatasourceMock weatherRemoteDatasource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(
    () {
      weatherLocalDataSource = WeatherLocalDataSourceMock();
      weatherRemoteDatasource = WeatherRemoteDatasourceMock();
      weatherRepositoryImpl = WeatherRepositoryImpl(
        localDatasource: weatherLocalDataSource,
        remoteDatasource: weatherRemoteDatasource,
      );
    },
  );

  group(
    'Get weather from local -',
    () {
      test(
        'Success',
        () async {
          // Given
          when(() => weatherLocalDataSource.getWeather()).thenAnswer(
            (invocation) async => successLocalResponse,
          );

          // When
          final result = await weatherRepositoryImpl.getWeatherFromLocal();

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
          expect(() async => weatherRepositoryImpl.getWeatherFromLocal(),
              throwsA(isInstanceOf<Exception>()));
          verify(() => weatherLocalDataSource.getWeather()).called(1);
        },
      );
    },
  );

  group(
    'Save weather -',
    () {
      test(
        'Success',
        () async {
          // Given
          when(() => weatherLocalDataSource.saveWeather(successLocalResponse))
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
          when(() => weatherLocalDataSource.saveWeather(successLocalResponse))
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

  group(
    'Get weather from remote -',
    () {
      test(
        'Success',
        () async {
          // Given
          when(() => weatherRemoteDatasource.getCurrentWeather(
              latitude: 1.0, longitude: 0.0)).thenAnswer(
            (invocation) async => successRemoteResponse,
          );

          // When
          final result = await weatherRepositoryImpl.getWeatherFromRemote(
            latitude: 1.0,
            longitude: 0.0,
          );

          // Then
          expect((result as Success).data, successEntityResult);
          verify(() => weatherRemoteDatasource.getCurrentWeather(
              latitude: 1.0, longitude: 0.0)).called(1);
        },
      );

      test(
        'Failure',
        () async {
          // Given
          when(() => weatherRemoteDatasource.getCurrentWeather(
              latitude: 1.0, longitude: 0.0)).thenThrow(
            Exception(),
          );

          // When
          final result = await weatherRepositoryImpl.getWeatherFromRemote(
            latitude: 1.0,
            longitude: 0.0,
          );

          // Then
          expect(result, isA<Failure>());
          verify(() => weatherRemoteDatasource.getCurrentWeather(
              latitude: 1.0, longitude: 0.0)).called(1);
        },
      );
    },
  );
}
