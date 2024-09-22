part of 'location_cubit.dart';

enum LocationStatus {
  loading,
  data,
}

class LocationState extends Equatable {
  final LocationStatus status;
  final Placemark? location;

  const LocationState({
    this.status = LocationStatus.loading,
    this.location,
  });

  @override
  List<Object?> get props => [
        status,
      ];

  LocationState copyWith({
    LocationStatus? status,
    Placemark? location,
  }) =>
      LocationState(
        status: status ?? this.status,
        location: location ?? this.location,
      );
}
