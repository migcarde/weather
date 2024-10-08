import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/services/location_service.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/weather_data_entity.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/domain/operations/icons/get_icon.dart';
import 'package:weather/domain/operations/weather/get_weather_from_local.dart';
import 'package:weather/domain/operations/weather/get_weather_from_remote.dart';
import 'package:weather/domain/operations/weather/params/get_icon_params.dart';
import 'package:weather/domain/operations/weather/params/get_weather_from_remote_params.dart';
import 'package:weather/domain/operations/weather/save_weather.dart';
import 'package:weather/ui/home/models/home_view_model.dart';
import 'package:weather/ui/home/models/weather_day_view_model.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getWeatherFromLocal,
    required this.saveWeather,
    required this.getWeatherFromRemote,
    required this.getIcon,
    required this.locationService,
  }) : super(const HomeState());

  final GetWeatherFromLocal getWeatherFromLocal;
  final SaveWeather saveWeather;
  final GetWeatherFromRemote getWeatherFromRemote;
  final GetIcon getIcon;
  final LocationService locationService;

  Future<void> init() async {
    final weatherFromLocale = await getWeatherFromLocal(NoParams());

    if (weatherFromLocale != null) {
      emit(
        state.copyWith(
          homeViewModel: weatherFromLocale.toHomeViewModel(),
          status: HomeStatus.data,
        ),
      );

      await _getLocationFromRemote();
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );
      await _getLocationFromRemote();
    }
  }

  Future<void> _getLocationFromRemote() async {
    final location = await locationService.getCurrentLocation();

    if (location != null &&
        location.latitude != null &&
        location.longitude != null) {
      final placemarks = await locationService.getPlacemarkFromLocation(
        latitude: location.latitude!,
        longitude: location.longitude!,
      );

      final remoteWeather = await getWeatherFromRemote(
        GetWeatherFromRemoteParams(
          latitude: location.latitude!,
          longitude: location.longitude!,
        ),
      );

      remoteWeather.when(
        (weather) async {
          final weatherSortedByDay =
              await _sortWeatherByDayAndGetIcons(weather);

          final homeViewModel = HomeViewModel(
            latitude: location.latitude!,
            longitude: location.longitude!,
            locationName: placemarks.first.locality ?? '',
            sunrise: weather.city?.sunrise,
            sunset: weather.city?.sunset,
            weatherDays: weatherSortedByDay,
          );

          saveWeather(homeViewModel.business);

          emit(
            state.copyWith(
              homeViewModel: homeViewModel,
            ),
          );
        },
        // TODO: Check this failure case
        (failure) => emit(
          state.copyWith(
            status: HomeStatus.data,
          ),
        ),
      );
    }
  }

  Future<List<WeatherDayViewModel>> _sortWeatherByDayAndGetIcons(
      WeatherEntity weather) async {
    final List<WeatherDayViewModel> result = [];

    for (int i = 0; i < weather.details.length; i++) {
      final weatherDetails = weather.details[i];

      final iconResult = await getIcon(
        GetIconParams(
          iconId: weatherDetails.details.first.id,
          iconPath: weatherDetails.details.first.icon,
        ),
      );
      final weatherData = weatherDetails.toViewModel(
        icon: iconResult.success ?? [],
      );

      final index = result.indexWhere(
        (e) => DateUtils.isSameDay(
          e.date,
          weatherDetails.date,
        ),
      );

      if (index != -1) {
        result[index] = result[index].addDay(weatherData);
      } else {
        _addWeatherDay(
          result: result,
          weatherData: weatherDetails,
          weatherDetails: weatherData,
        );
      }
    }

    return result;
  }

  void _addWeatherDay({
    required List<WeatherDayViewModel> result,
    required WeatherDataEntity weatherData,
    required WeatherDetailsViewModel weatherDetails,
  }) {
    final weatherDayResult = WeatherDayViewModel(
      date: DateUtils.dateOnly(weatherData.date),
      weatherData: [
        weatherDetails,
      ],
    );

    result.add(weatherDayResult);
  }
}
