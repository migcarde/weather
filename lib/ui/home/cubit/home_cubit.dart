import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/location_service.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/weather_business.dart';
import 'package:weather/domain/operations/get_weather.dart';
import 'package:weather/domain/operations/save_weather.dart';
import 'package:weather/ui/home/models/home_view_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getWeather,
    required this.saveWeather,
    required this.locationService,
  }) : super(const HomeState());

  final GetWeather getWeather;
  final SaveWeather saveWeather;
  final LocationService locationService;

  Future<void> init() async {
    final weatherFromLocale = await getWeather(NoParams());

    if (weatherFromLocale != null) {
      // TODO: Set weather in home
      emit(
        state.copyWith(
          homeViewModel: weatherFromLocale.toHomeViewModel(),
          status: HomeStatus.data,
        ),
      );
      // TODO: Get weather from remote
      final weather = await _getLocationFromRemote();
      emit(
        state.copyWith(
          homeViewModel: weather?.toHomeViewModel(),
          status: HomeStatus.data,
        ),
      );
      // TODO: Save cubit
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );
      // TODO: Get weather from remote
      final weather = await _getLocationFromRemote();
      emit(
        state.copyWith(
          homeViewModel: weather?.toHomeViewModel(),
          status: HomeStatus.data,
        ),
      );
      // TODO: Save cubit
    }
  }

  Future<WeatherBusiness?> _getLocationFromRemote() async {
    final location = await locationService.getCurrentLocation();

    if (location != null &&
        location.latitude != null &&
        location.longitude != null) {
      final placemarks = await locationService.getPlacemarkFromLocation(
        latitude: location.latitude!,
        longitude: location.longitude!,
      );

      final result = WeatherBusiness(
        latitude: location.latitude!,
        longitude: location.longitude!,
        locationName: placemarks.first.locality ?? '',
      );
      // TODO: Get weather data from remote
      saveWeather(
        result,
      );

      return result;
    }

    return null;
  }
}
