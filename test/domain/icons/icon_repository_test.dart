import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/local/icon_local_datasource.dart';
import 'package:weather/data/remote/icons/icons_remote_datasource.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/operations/icons/icon_repository_impl.dart';

import 'icon_instruments.dart';

class IconLocalDatasourceMock extends Mock implements IconLocalDatasource {}

class IconRemoteDatasourceMock extends Mock implements IconsRemoteDatasource {}

void main() {
  late IconLocalDatasourceMock iconLocalDatasource;
  late IconRemoteDatasourceMock iconRemoteDatasource;
  late IconRepositoryImpl iconRepository;

  setUp(() {
    iconLocalDatasource = IconLocalDatasourceMock();
    iconRemoteDatasource = IconRemoteDatasourceMock();
    iconRepository = IconRepositoryImpl(
      iconsRemoteDatasource: iconRemoteDatasource,
      iconLocalDatasource: iconLocalDatasource,
    );
  });

  group('Get icon from local -', () {
    test('Success', () async {
      // Given
      when(() => iconLocalDatasource.getIcon(1))
          .thenAnswer((invocation) async => iconLocalEntityResult);

      // When
      final result = await iconRepository.getImageFromLocal(1);

      // Then
      expect((result as Success).data, Uint8List(1));
      verify(() => iconLocalDatasource.getIcon(1)).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => iconLocalDatasource.getIcon(1))
          .thenAnswer((invocation) async => null);

      // When
      final result = await iconRepository.getImageFromLocal(1);

      // Then
      expect((result as Success).data, null);
      verify(() => iconLocalDatasource.getIcon(1)).called(1);
    });
  });

  group('Get icon from remote -', () {
    test('Success', () async {
      // Given
      when(() => iconLocalDatasource.getIcon(1))
          .thenAnswer((invocation) async => null);
      when(() => iconRemoteDatasource.getImage('10n'))
          .thenAnswer((invocation) async => [1]);
      when(() => iconLocalDatasource.saveIcon(iconLocalEntityToSave))
          .thenAnswer((invocation) async {});

      // When
      final result = await iconRepository.getImage(1, '10n');

      // Then
      expect((result as Success).data, Uint8List.fromList([1]));
      verify(() => iconLocalDatasource.getIcon(1)).called(1);
      verify(() => iconRemoteDatasource.getImage('10n')).called(1);
      verify(() => iconLocalDatasource.saveIcon(iconLocalEntityToSave))
          .called(1);
    });

    test('Success with local data', () async {
      // Given
      when(() => iconLocalDatasource.getIcon(1))
          .thenAnswer((invocation) async => iconLocalEntityResult);

      // When
      final result = await iconRepository.getImage(1, '10n');

      // Then
      expect((result as Success).data, Uint8List(1));
      verify(() => iconLocalDatasource.getIcon(1)).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => iconLocalDatasource.getIcon(1))
          .thenAnswer((invocation) async => null);
      when(() => iconRemoteDatasource.getImage('10n')).thenThrow(Exception());

      // When
      final result = await iconRepository.getImage(1, '10n');

      // Then
      expect(result, isA<Failure>());
      verify(() => iconLocalDatasource.getIcon(1)).called(1);
      verify(() => iconRemoteDatasource.getImage('10n')).called(1);
    });
  });
}
