import 'dart:typed_data';
import 'package:weather/data/local/icon_local_entity.dart';

// Local entities
final iconLocalEntityResult = IconLocalEntity(
  id: 1,
  image: Uint8List(1),
);

final iconLocalEntityToSave = IconLocalEntity(
  id: 1,
  image: Uint8List.fromList([1]),
);
