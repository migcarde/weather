import 'package:hive/hive.dart';
import 'package:weather/core/extensions/hive_extensions.dart';
import 'package:weather/core/services/logger_service.dart';
import 'package:weather/data/local/icon_local_datasource.dart';
import 'package:weather/data/local/icon_local_entity.dart';

class IconLocalDatasourceImpl extends IconLocalDatasource {
  static const _boxName = 'iconBox';

  final HiveInterface hive;

  IconLocalDatasourceImpl({
    required this.hive,
  });

  @override
  Future<IconLocalEntity?> getIcon(int iconId) async {
    try {
      final box = await hive.getBox<IconLocalEntity>(_boxName);
      final result = box.values.where((icon) => icon.id == iconId).first;
      await box.close();

      return result;
    } catch (e) {
      logger.error(e);

      return null;
    }
  }

  @override
  Future<void> saveIcon(IconLocalEntity icon) async {
    try {
      final box = await hive.getBox<IconLocalEntity>(_boxName);
      box.add(icon);
      await box.close();
    } catch (e) {
      logger.error(e);
    }
  }
}
