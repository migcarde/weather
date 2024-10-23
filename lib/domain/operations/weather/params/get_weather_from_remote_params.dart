import 'package:equatable/equatable.dart';

class GetWeatherFromRemoteParams extends Equatable {
  final double latitude;
  final double longitude;

  const GetWeatherFromRemoteParams({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
