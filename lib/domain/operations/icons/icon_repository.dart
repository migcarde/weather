import 'package:weather/domain/base/result.dart';

abstract class IconRepository {
  Future<Result<List<int>>> downloadImage(String image);
  Future<Result<List<int>>> getImage(int iconId, String iconPath);
  Future<Result<List<int>?>> getImageFromLocal(int iconId);
}
