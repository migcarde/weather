import 'dart:typed_data';

import 'package:weather/domain/base/result.dart';

abstract class IconRepository {
  Future<Result<Uint8List>> getImage(int iconId, String iconPath);
  Future<Result<Uint8List?>> getImageFromLocal(int iconId);
}
