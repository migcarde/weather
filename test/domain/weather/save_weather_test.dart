import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/operations/weather/save_weather.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';

import 'weather_instruments.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  late WeatherRepositoryMock weatherRepositoryMock;
  late SaveWeather saveWeather;

  setUp(
    () {
      weatherRepositoryMock = WeatherRepositoryMock();
      saveWeather = SaveWeather(
        weatherRepository: weatherRepositoryMock,
      );
    },
  );

  group('Save weather -', () {
    test('Success', () {
      // Given
      when(() => weatherRepositoryMock.saveWeather(successResult)).thenAnswer(
        (invocation) async {},
      );

      // Then
      expect(
        () async => await saveWeather(successResult),
        isA<void>(),
      );
    });

    test('Failure', () {
      // Given
      when(() => weatherRepositoryMock.saveWeather(successResult))
          .thenThrow(Exception());

      // Then
      expect(
        () async => await saveWeather(successResult),
        isA<void>(),
      );
    });
  });
}
