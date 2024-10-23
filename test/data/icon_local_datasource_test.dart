import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/local/icon_local_datasource_impl.dart';
import 'package:weather/data/local/icon_local_entity.dart';

class BoxMock<T> extends Mock implements Box<T> {}

class HiveInterfaceMock extends Mock implements HiveInterface {}

void main() {
  late BoxMock<IconLocalEntity> boxMock;
  late HiveInterfaceMock hiveInterfaceMock;
  late IconLocalDatasourceImpl iconLocalDatasource;

  const box = 'iconBox';

  setUp(() {
    final path = Directory.current.path;
    Hive.init(path);
    boxMock = BoxMock<IconLocalEntity>();
    hiveInterfaceMock = HiveInterfaceMock();
    iconLocalDatasource = IconLocalDatasourceImpl(
      hive: hiveInterfaceMock,
    );
  });

  group('Get icon from local -', () {
    final successResult = IconLocalEntity(
      id: 1,
      image: Uint8List(1),
    );
    test('Success', () async {
      // Given
      when(() => hiveInterfaceMock.isBoxOpen(box))
          .thenAnswer((invocation) => false);
      when(() => hiveInterfaceMock.openBox<IconLocalEntity>(box))
          .thenAnswer((invocation) async => boxMock);
      when(() => boxMock.values).thenAnswer((invocation) => [successResult]);
      when(() => boxMock.close()).thenAnswer((invocation) async {});

      final result = await iconLocalDatasource.getIcon(1);

      // Then
      expect(result, successResult);
      verify(() => hiveInterfaceMock.openBox<IconLocalEntity>(box)).called(1);
      verify(() => boxMock.values).called(1);
    });

    test('Failure and return null value', () async {
      // Given
      when(() => hiveInterfaceMock.isBoxOpen(box))
          .thenAnswer((invocation) => false);
      when(() => hiveInterfaceMock.openBox<IconLocalEntity>(box))
          .thenThrow(Exception());

      final result = await iconLocalDatasource.getIcon(1);

      // Then
      expect(result, null);
      verify(() => hiveInterfaceMock.openBox<IconLocalEntity>(box)).called(1);
    });
  });

  group('Save weather to local -', () {
    final iconToSave = IconLocalEntity(
      id: 1,
      image: Uint8List(1),
    );
    test('Success', () async {
      // Given
      when(() => hiveInterfaceMock.isBoxOpen(box))
          .thenAnswer((invocation) => false);
      when(() => hiveInterfaceMock.openBox<IconLocalEntity>(box))
          .thenAnswer((invocation) async => boxMock);
      when(() => boxMock.add(iconToSave)).thenAnswer((invocation) async => 1);
      when(() => boxMock.close()).thenAnswer((invocation) async {});

      // Then
      expect(() => iconLocalDatasource.saveIcon(iconToSave), isA<void>());
    });

    test('Failure and do nothing', () async {
      // Given
      when(() => hiveInterfaceMock.isBoxOpen(box))
          .thenAnswer((invocation) => false);
      when(() => hiveInterfaceMock.openBox<IconLocalEntity>(box))
          .thenAnswer((invocation) async => boxMock);
      when(() => boxMock.add(iconToSave)).thenThrow(Exception());
      when(() => boxMock.close()).thenAnswer((invocation) async {});

      // Then
      expect(() => iconLocalDatasource.saveIcon(iconToSave), isA<void>());
    });
  });
}
