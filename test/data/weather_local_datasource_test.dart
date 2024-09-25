import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/local/weather_local_datasource_impl.dart';
import 'package:weather/data/local/weather_local_entity.dart';

class BoxMock<T> extends Mock implements Box<T> {}

class HiveInterfaceMock extends Mock implements HiveInterface {}

void main() {
  late BoxMock<WeatherLocalEntity> boxMock;
  late HiveInterfaceMock hiveInterfaceMock;
  late WeatherLocalDatasourceImpl weatherLocalDatasource;

  const box = 'weatherBox';

  setUp(() {
    final path = Directory.current.path;
    Hive.init(path);
    boxMock = BoxMock<WeatherLocalEntity>();
    hiveInterfaceMock = HiveInterfaceMock();
    weatherLocalDatasource = WeatherLocalDatasourceImpl(
      hive: hiveInterfaceMock,
    );
  });

  group(
    'Get weather from local -',
    () {
      final successResult = WeatherLocalEntity(
        latitude: 0.0,
        longitude: 1.0,
        locationName: 'locationName',
      );
      test(
        'Success',
        () async {
          // Given
          when(() => hiveInterfaceMock.isBoxOpen(box))
              .thenAnswer((invocation) => false);
          when(() => hiveInterfaceMock.openBox<WeatherLocalEntity>(box))
              .thenAnswer(
            (invocation) async => boxMock,
          );
          when(() => boxMock.values)
              .thenAnswer((invocation) => [successResult]);
          when(() => boxMock.close()).thenAnswer((invocation) async {});

          // When
          final result = await weatherLocalDatasource.getWeather();

          // Then
          expect(result, successResult);
          verify(() => hiveInterfaceMock.openBox<WeatherLocalEntity>(box))
              .called(1);
          verify(() => boxMock.values).called(1);
        },
      );

      test(
        'Failure and return null value',
        () async {
          // Given
          when(() => hiveInterfaceMock.isBoxOpen(box))
              .thenAnswer((invocation) => false);
          when(() => hiveInterfaceMock.openBox<WeatherLocalEntity>(box))
              .thenAnswer(
            (invocation) async => boxMock,
          );
          when(() => boxMock.values).thenAnswer((invocation) => []);
          when(() => boxMock.close()).thenAnswer((invocation) async {});

          // When
          final result = await weatherLocalDatasource.getWeather();

          // Then
          expect(result, null);
          verify(() => hiveInterfaceMock.openBox<WeatherLocalEntity>(box))
              .called(1);
          verify(() => boxMock.values).called(1);
        },
      );
    },
  );
}
