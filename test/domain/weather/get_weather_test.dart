import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/operations/weather/get_weather_from_local.dart';
import 'package:weather/domain/operations/weather/weather_repository.dart';

import 'weather_instruments.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  late WeatherRepositoryMock weatherRepository;
  late GetWeatherFromLocal getWeather;

  setUp(
    () {
      weatherRepository = WeatherRepositoryMock();
      getWeather = GetWeatherFromLocal(
        repository: weatherRepository,
      );
    },
  );

  group(
    'Get weather -',
    () {
      test('Success', () async {
        // Given
        when(() => weatherRepository.getWeatherFromLocal()).thenAnswer(
          (invocation) async => successResult,
        );

        // When
        final result = await getWeather(NoParams());

        // Then
        expect(result, successResult);
        verify(() => weatherRepository.getWeatherFromLocal()).called(1);
      });

      test('Failure', () async {
        // Given
        when(() => weatherRepository.getWeatherFromLocal())
            .thenThrow(Exception());

        // Then
        expect(() async => await getWeather(NoParams()),
            throwsA(isInstanceOf<Exception>()));
        verify(() => weatherRepository.getWeatherFromLocal()).called(1);
      });
    },
  );
}
