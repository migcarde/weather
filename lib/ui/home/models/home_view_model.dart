import 'package:equatable/equatable.dart';

class HomeViewModel extends Equatable {
  final double latitude;
  final double longitude;
  final String locationName;

  const HomeViewModel({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        locationName,
      ];
}
