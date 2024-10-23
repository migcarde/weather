import 'package:weather/data/local/icon_local_entity.dart';

abstract class IconLocalDatasource {
  Future<IconLocalEntity?> getIcon(int iconId);
  Future<void> saveIcon(IconLocalEntity icon);
}
