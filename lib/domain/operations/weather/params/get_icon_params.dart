import 'package:equatable/equatable.dart';

class GetIconParams extends Equatable {
  final int iconId;
  final String iconPath;

  const GetIconParams({
    required this.iconId,
    required this.iconPath,
  });

  @override
  List<Object?> get props => [
        iconId,
        iconPath,
      ];
}
