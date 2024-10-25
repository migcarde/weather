import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class WeeklyWeatherViewModel extends Equatable {
  final Uint8List icon;
  final DateTime date;
  final int minTemperature;
  final int maxTemperature;

  const WeeklyWeatherViewModel({
    required this.icon,
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
  });

  @override
  List<Object?> get props => [
        icon,
        date,
        minTemperature,
        maxTemperature,
      ];
}
