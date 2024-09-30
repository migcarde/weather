import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/save_weather.dart';
import 'package:weather/domain/operations/weather_repository.dart';

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
    const successResult = WeatherBusiness(
      latitude: 0.0,
      longitude: 1.0,
      locationName: 'locationName',
    );

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
