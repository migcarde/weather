import 'dart:typed_data';

import 'package:weather/core/services/logger_service.dart';
import 'package:weather/data/local/icon_local_datasource.dart';
import 'package:weather/data/local/icon_local_entity.dart';
import 'package:weather/data/remote/icons/icons_remote_datasource.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/operations/icons/icon_repository.dart';

class IconRepositoryImpl implements IconRepository {
  final IconsRemoteDatasource iconsRemoteDatasource;
  final IconLocalDatasource iconLocalDatasource;

  const IconRepositoryImpl({
    required this.iconsRemoteDatasource,
    required this.iconLocalDatasource,
  });

  @override
  Future<Result<Uint8List>> getImage(int iconId, String iconPath) async {
    try {
      final imageFromLocalResult = await iconLocalDatasource.getIcon(iconId);

      if (imageFromLocalResult != null) {
        return Result.success(imageFromLocalResult.image);
      } else {
        final imageFromRemoteResult =
            await iconsRemoteDatasource.getImage(iconPath);

        iconLocalDatasource.saveIcon(
          IconLocalEntity(
            id: iconId,
            image: Uint8List.fromList(imageFromRemoteResult),
          ),
        );

        return Result.success(Uint8List.fromList(imageFromRemoteResult));
      }
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }

  @override
  Future<Result<Uint8List?>> getImageFromLocal(int iconId) async {
    try {
      final result = await iconLocalDatasource.getIcon(iconId);

      return Result.success(result?.image);
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }
}
