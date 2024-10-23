import 'package:weather/data/remote/icons/icons_api.dart';
import 'package:weather/data/remote/icons/icons_remote_datasource.dart';

class IconsRemoteDatasourceImpl implements IconsRemoteDatasource {
  final IconsApi api;

  const IconsRemoteDatasourceImpl({
    required this.api,
  });

  @override
  Future<List<int>> getImage(String image) async {
    final result = await api.downloadImage(image);

    return result.data;
  }
}
