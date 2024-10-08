import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/operations/icons/icon_repository.dart';
import 'package:weather/domain/operations/weather/params/get_icon_params.dart';

class GetIcon implements BaseUseCase<Result<List<int>>, GetIconParams> {
  final IconRepository iconRepository;

  const GetIcon({required this.iconRepository});

  @override
  Future<Result<List<int>>> call(GetIconParams params) =>
      iconRepository.getImage(
        params.iconId,
        params.iconPath,
      );
}
