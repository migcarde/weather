import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';

class LocationService {
  Future<LocationData?> getCurrentLocation() async {
    final location = Location();
    final isAvailable = await _checkAvailability(location: location);

    if (isAvailable) {
      return await location.getLocation();
    }

    return null;
  }

  Future<bool> _checkAvailability({required Location location}) async {
    final serviceEnabled = await location.requestService();

    if (!serviceEnabled) {
      return false;
    }

    final permissionStatus = await location.requestPermission();

    if (permissionStatus != PermissionStatus.granted &&
        permissionStatus != PermissionStatus.grantedLimited) {
      return false;
    }

    return true;
  }

  Future<List<geocoding.Placemark>> getPlacemarkFromLocation({
    required double latitude,
    required double longitude,
  }) async =>
      await geocoding.placemarkFromCoordinates(
        latitude,
        longitude,
      );
}
