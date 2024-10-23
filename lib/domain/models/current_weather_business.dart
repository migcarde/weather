import 'package:equatable/equatable.dart';

class CurrentWeatherBusiness extends Equatable {
  final DateTime startTime;
  final DateTime endTime;
  final int iconId;
  final int degrees;

  const CurrentWeatherBusiness({
    required this.startTime,
    required this.endTime,
    required this.iconId,
    required this.degrees,
  });

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        iconId,
        degrees,
      ];
}
