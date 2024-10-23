import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/services/location_service.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/base/result.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/business/weather_data_business.dart';
import 'package:weather/domain/models/business/weather_day_business.dart';
import 'package:weather/domain/models/city_entity.dart';
import 'package:weather/domain/models/main_entity.dart';
import 'package:weather/domain/models/weather_data_entity.dart';
import 'package:weather/domain/models/weather_details_entity.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/domain/models/wind_entity.dart';
import 'package:weather/domain/operations/icons/get_icon.dart';
import 'package:weather/domain/operations/weather/get_weather_from_local.dart';
import 'package:weather/domain/operations/weather/get_weather_from_remote.dart';
import 'package:weather/domain/operations/weather/params/get_icon_params.dart';
import 'package:weather/domain/operations/weather/params/get_weather_from_remote_params.dart';
import 'package:weather/domain/operations/weather/save_weather.dart';
import 'package:weather/ui/home/cubit/home_cubit.dart';
import 'package:weather/ui/home/models/home_view_model.dart';
import 'package:weather/ui/home/models/weather_day_view_model.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

part 'home_entity_instruments.dart';

class LocationServiceMock extends Mock implements LocationService {}

class GetWeatherFromLocalMock extends Mock implements GetWeatherFromLocal {}

class SaveWeatherMock extends Mock implements SaveWeather {}

class GetIconMock extends Mock implements GetIcon {}

class GetWeatherFromRemoteMock extends Mock implements GetWeatherFromRemote {}

void main() {
  late LocationServiceMock locationService;
  late GetWeatherFromLocalMock getWeatherFromLocal;
  late SaveWeatherMock saveWeather;
  late HomeCubit cubit;
  late GetIconMock getIcon;
  late GetWeatherFromRemote getWeatherFromRemote;

  setUp(() {
    locationService = LocationServiceMock();
    getWeatherFromLocal = GetWeatherFromLocalMock();
    saveWeather = SaveWeatherMock();
    getIcon = GetIconMock();
    getWeatherFromRemote = GetWeatherFromRemoteMock();

    cubit = HomeCubit(
      getWeatherFromLocal: getWeatherFromLocal,
      saveWeather: saveWeather,
      locationService: locationService,
      getIcon: getIcon,
      getWeatherFromRemote: getWeatherFromRemote,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('init', () {
    blocTest<HomeCubit, HomeState>(
      'emits [data] when have local data, update it from remote and save',
      build: () {
        // Given
        when(() => getWeatherFromLocal(NoParams())).thenAnswer(
          (invocation) async => localSuccess,
        );
        when(() => locationService.getCurrentLocation()).thenAnswer(
          (invocation) async => locationSuccess,
        );
        when(() => locationService.getPlacemarkFromLocation(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!)).thenAnswer(
          (invocation) async => const [
            Placemark(locality: 'locationName'),
          ],
        );
        when(() => getWeatherFromRemote(GetWeatherFromRemoteParams(
                latitude: locationSuccess.latitude!,
                longitude: locationSuccess.longitude!)))
            .thenAnswer((invocation) async =>
                Result.success(getFromRemoteEntitySuccessWithoutDetails));

        when(() => saveWeather(saveSuccessWithoutData))
            .thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 0.0,
            longitude: 1.0,
            locationName: 'locationName',
            sunrise: sunrise,
            sunset: sunset,
            weatherDays: const [],
          ),
        ),
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 2.0,
            longitude: 3.0,
            locationName: 'locationName',
            sunrise: sunrise,
            sunset: sunset,
            weatherDays: const [],
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, data] when not have local data, get it from remote and save',
      build: () {
        // Given
        when(() => getWeatherFromLocal(NoParams())).thenAnswer(
          (invocation) async => null,
        );
        when(() => locationService.getCurrentLocation()).thenAnswer(
          (invocation) async => locationSuccess,
        );
        when(() => locationService.getPlacemarkFromLocation(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!)).thenAnswer(
          (invocation) async => const [
            Placemark(locality: 'locationName'),
          ],
        );
        when(() => getWeatherFromRemote(GetWeatherFromRemoteParams(
                latitude: locationSuccess.latitude!,
                longitude: locationSuccess.longitude!)))
            .thenAnswer((invocation) async =>
                Result.success(getFromRemoteEntitySuccessWithoutDetails));
        when(() => saveWeather(saveSuccessWithoutData))
            .thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(
          status: HomeStatus.loading,
        ),
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 2.0,
            longitude: 3.0,
            locationName: 'locationName',
            sunrise: sunrise,
            sunset: sunset,
            weatherDays: const [],
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, data] when not have local data, get it from remote with weather data, sort it by day and get icons success',
      build: () {
        // Given
        when(() => getWeatherFromLocal(NoParams())).thenAnswer(
          (invocation) async => null,
        );
        when(() => locationService.getCurrentLocation()).thenAnswer(
          (invocation) async => locationSuccess,
        );
        when(() => locationService.getPlacemarkFromLocation(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!)).thenAnswer(
          (invocation) async => const [
            Placemark(locality: 'locationName'),
          ],
        );
        when(() => getWeatherFromRemote(
            GetWeatherFromRemoteParams(
                latitude: locationSuccess.latitude!,
                longitude: locationSuccess.longitude!))).thenAnswer(
            (invocation) async => Result.success(getFromRemoteEntitySuccess));
        when(() => getIcon(const GetIconParams(iconId: 1, iconPath: '10a')))
            .thenAnswer((invocation) async => Result.success(Uint8List(1)));
        when(() => saveWeather(saveSuccess)).thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(
          status: HomeStatus.loading,
        ),
        HomeState(
          status: HomeStatus.data,
          homeViewModel: homeViewModelSuccess,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, failure] when not have local data, get it from remote and it fails',
      build: () {
        // Given
        when(() => getWeatherFromLocal(NoParams())).thenAnswer(
          (invocation) async => null,
        );
        when(() => locationService.getCurrentLocation()).thenAnswer(
          (invocation) async => locationSuccess,
        );
        when(() => locationService.getPlacemarkFromLocation(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!)).thenAnswer(
          (invocation) async => const [
            Placemark(locality: 'locationName'),
          ],
        );
        when(() => getWeatherFromRemote(GetWeatherFromRemoteParams(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!))).thenAnswer(
          (invocation) async => Result.failure(Exception()),
        );

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(
          status: HomeStatus.loading,
        ),
        const HomeState(
          status: HomeStatus.failure,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [data] when have local data, update it from remote and remote fails on update',
      build: () {
        // Given
        when(() => getWeatherFromLocal(NoParams())).thenAnswer(
          (invocation) async => localSuccess,
        );
        when(() => locationService.getCurrentLocation()).thenAnswer(
          (invocation) async => locationSuccess,
        );
        when(() => locationService.getPlacemarkFromLocation(
            latitude: locationSuccess.latitude!,
            longitude: locationSuccess.longitude!)).thenAnswer(
          (invocation) async => const [
            Placemark(locality: 'locationName'),
          ],
        );
        when(() => getWeatherFromRemote(GetWeatherFromRemoteParams(
                latitude: locationSuccess.latitude!,
                longitude: locationSuccess.longitude!)))
            .thenAnswer((invocation) async => Result.failure(Exception()));

        when(() => saveWeather(saveSuccessWithoutData))
            .thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 0.0,
            longitude: 1.0,
            locationName: 'locationName',
            sunrise: sunrise,
            sunset: sunset,
            weatherDays: const [],
          ),
        ),
      ],
    );
  });
}
