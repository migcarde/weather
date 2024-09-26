import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/get_weather.dart';
import 'package:weather/domain/operations/weather_repository.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  late WeatherRepositoryMock weatherRepository;
  late GetWeather getWeather;

  setUp(
    () {
      weatherRepository = WeatherRepositoryMock();
      getWeather = GetWeather(
        repository: weatherRepository,
      );
    },
  );

  group(
    'Get weather -',
    () {
      const successResult = WeatherBusiness(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );
      test('Success', () async {
        // Given
        when(() => weatherRepository.getWeather()).thenAnswer(
          (invocation) async => successResult,
        );

        // When
        final result = await getWeather(NoParams());

        // Then
        expect(result, successResult);
        verify(() => weatherRepository.getWeather()).called(1);
      });

      test('Failure', () async {
        // Given
        when(() => weatherRepository.getWeather()).thenThrow(Exception());

        // Then
        expect(() async => await getWeather(NoParams()),
            throwsA(isInstanceOf<Exception>()));
        verify(() => weatherRepository.getWeather()).called(1);
      });
    },
  );
}
