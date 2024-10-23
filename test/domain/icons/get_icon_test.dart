import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/operations/icons/get_icon.dart';
import 'package:weather/domain/operations/icons/icon_repository.dart';
import 'package:weather/domain/operations/weather/params/get_icon_params.dart';

class IconRepositoryMock extends Mock implements IconRepository {}

void main() {
  late IconRepositoryMock iconRepository;
  late GetIcon getIcon;

  setUp(() {
    iconRepository = IconRepositoryMock();
    getIcon = GetIcon(
      iconRepository: iconRepository,
    );
  });

  group('Get icon -', () {
    test('Success', () async {
      // Given
      when(() => iconRepository.getImage(1, 'iconPath'))
          .thenAnswer((invocation) async => Result.success(Uint8List(1)));

      // When
      final result = await getIcon(
        const GetIconParams(
          iconId: 1,
          iconPath: 'iconPath',
        ),
      );

      // Then
      expect((result as Success).data, Uint8List(1));
      verify(() => iconRepository.getImage(1, 'iconPath')).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => iconRepository.getImage(1, 'iconPath')).thenThrow(Exception());

      // Then
      expect(
          () async => await getIcon(
                const GetIconParams(
                  iconId: 1,
                  iconPath: 'iconPath',
                ),
              ),
          throwsA(isInstanceOf<Exception>()));
      verify(() => iconRepository.getImage(1, 'iconPath')).called(1);
    });
  });
}
