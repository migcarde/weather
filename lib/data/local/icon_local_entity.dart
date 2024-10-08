import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather/data/local/local_types_ids.dart';

part 'icon_local_entity.g.dart';

@HiveType(typeId: LocalTypesIds.iconId)
class IconLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final List<int> image;

  IconLocalEntity({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        image,
      ];
}
