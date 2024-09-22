import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/core/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required this.locationService,
  }) : super(const LocationState());

  final LocationService locationService;

  Future<void> getLocation() async {
    final location = await locationService.getCurrentLocation();

    if (location != null &&
        location.latitude != null &&
        location.longitude != null) {
      final placemarks = await placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );

      emit(
        state.copyWith(
          status: LocationStatus.data,
          location: placemarks.first,
        ),
      );
    }
  }
}
