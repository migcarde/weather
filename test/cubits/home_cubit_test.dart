import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/services/location_service.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/operations/weather/get_weather_from_local.dart';
import 'package:weather/domain/operations/weather/save_weather.dart';
import 'package:weather/ui/home/cubit/home_cubit.dart';
import 'package:weather/ui/home/models/home_view_model.dart';

class LocationServiceMock extends Mock implements LocationService {}

class GetWeatherMock extends Mock implements GetWeatherFromLocal {}

class SaveWeatherMock extends Mock implements SaveWeather {}

void main() {
  late LocationServiceMock locationService;
  late GetWeatherMock getWeather;
  late SaveWeatherMock saveWeather;
  late HomeCubit cubit;

  setUp(() {
    locationService = LocationServiceMock();
    getWeather = GetWeatherMock();
    saveWeather = SaveWeatherMock();
    cubit = HomeCubit(
      getWeatherFromLocal: getWeather,
      saveWeather: saveWeather,
      locationService: locationService,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('init', () {
    const localSuccess = WeatherBusiness(
      latitude: 0.0,
      longitude: 1.0,
      locationName: 'locationName',
    );
    final locationSuccess = LocationData.fromMap(
      {
        'latitude': 2.0,
        'longitude': 3.0,
      },
    );
    const remoteSuccess = WeatherBusiness(
      latitude: 2.0,
      longitude: 3.0,
      locationName: 'locationName',
    );
    blocTest<HomeCubit, HomeState>(
      'emits [data] when have local data, update it from remote and save',
      build: () {
        // Given
        when(() => getWeather(NoParams())).thenAnswer(
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
        when(() => saveWeather(remoteSuccess))
            .thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => const [
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 0.0,
            longitude: 1.0,
            locationName: 'locationName',
          ),
        ),
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 2.0,
            longitude: 3.0,
            locationName: 'locationName',
          ),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, data] when not have local data, get it from remote and save',
      build: () {
        // Given
        when(() => getWeather(NoParams())).thenAnswer(
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
        when(() => saveWeather(remoteSuccess))
            .thenAnswer((invocation) async {});

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => const [
        HomeState(
          status: HomeStatus.loading,
        ),
        HomeState(
          status: HomeStatus.data,
          homeViewModel: HomeViewModel(
            latitude: 2.0,
            longitude: 3.0,
            locationName: 'locationName',
          ),
        ),
      ],
    );
  });
}
