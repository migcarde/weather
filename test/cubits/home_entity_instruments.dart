part of 'home_cubit_test.dart';

// Dates
final sunrise = DateTime(2024, 02, 20);
final sunset = DateTime(2024, 03, 20);
final currentDay = DateTime(2024, 02, 20);
final nextDay = DateTime(2024, 02, 21);
final currentDayDetailsFirstPosition = DateTime(2024, 02, 20, 1, 0, 0);
final currentDayDetailsSecondPosition = DateTime(2024, 02, 20, 4, 0, 1);

// Business entities
final localSuccess = WeatherBusiness(
  latitude: 0.0,
  longitude: 1.0,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: const [],
);

final saveSuccessWithoutData = WeatherBusiness(
  latitude: 2.0,
  longitude: 3.0,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: const [],
);

final saveSuccess = WeatherBusiness(
  latitude: 2.0,
  longitude: 3.0,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: [
    WeatherDayBusiness(
      date: currentDay,
      weatherData: [
        WeatherDataBusiness(
          time: currentDayDetailsFirstPosition,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
        WeatherDataBusiness(
          time: currentDayDetailsSecondPosition,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
      ],
    ),
    WeatherDayBusiness(
      date: nextDay,
      weatherData: [
        WeatherDataBusiness(
          time: nextDay,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
      ],
    ),
  ],
);

// Location data
final locationSuccess = LocationData.fromMap(
  {
    'latitude': 2.0,
    'longitude': 3.0,
  },
);

// Weather entities
final getFromRemoteEntitySuccess = WeatherEntity(
  cod: 'cod',
  message: 0,
  cnt: 10,
  details: [
    WeatherDataEntity(
      date: currentDayDetailsFirstPosition,
      main: const MainEntity(
        temperature: 10,
        temperatureFeeling: 20,
        minTemperature: 3,
        maxTemperature: 40,
        pressure: 10,
        seaLevel: 13,
        groundLevel: 0,
        humidity: 2,
        temperatureKf: 120,
      ),
      details: const [
        WeatherDetailsEntity(
          id: 1,
          main: 'weatherDetailsEntity',
          description: 'description',
          icon: '10a',
        ),
      ],
      clouds: 30,
      wind: const WindEntity(
        speed: 60,
        degrees: 50,
        gust: 90.0,
      ),
      pop: 20.0,
      precipitation: 30.0,
      isNight: false,
      visibility: 20,
    ),
    WeatherDataEntity(
      date: currentDayDetailsSecondPosition,
      main: const MainEntity(
        temperature: 10,
        temperatureFeeling: 20,
        minTemperature: 3,
        maxTemperature: 40,
        pressure: 10,
        seaLevel: 13,
        groundLevel: 0,
        humidity: 2,
        temperatureKf: 120,
      ),
      details: const [
        WeatherDetailsEntity(
          id: 1,
          main: 'weatherDetailsEntity',
          description: 'description',
          icon: '10a',
        ),
      ],
      clouds: 30,
      wind: const WindEntity(
        speed: 60,
        degrees: 50,
        gust: 90.0,
      ),
      pop: 20.0,
      precipitation: 30.0,
      isNight: false,
      visibility: 20,
    ),
    WeatherDataEntity(
      date: nextDay,
      main: const MainEntity(
        temperature: 10,
        temperatureFeeling: 20,
        minTemperature: 3,
        maxTemperature: 40,
        pressure: 10,
        seaLevel: 13,
        groundLevel: 0,
        humidity: 2,
        temperatureKf: 120,
      ),
      details: const [
        WeatherDetailsEntity(
          id: 1,
          main: 'weatherDetailsEntity',
          description: 'description',
          icon: '10a',
        ),
      ],
      clouds: 30,
      wind: const WindEntity(
        speed: 60,
        degrees: 50,
        gust: 90.0,
      ),
      pop: 20.0,
      precipitation: 30.0,
      isNight: false,
      visibility: 20,
    ),
  ],
  city: CityEntity(
    id: 1,
    name: 'name',
    latitude: 10.0,
    longitude: 20.0,
    country: 'country',
    population: 0,
    timezone: 10000,
    sunrise: sunrise,
    sunset: sunset,
  ),
);

final getFromRemoteEntitySuccessWithoutDetails = WeatherEntity(
  cod: 'cod',
  message: 0,
  cnt: 10,
  details: const [],
  city: CityEntity(
    id: 1,
    name: 'name',
    latitude: 10.0,
    longitude: 20.0,
    country: 'country',
    population: 0,
    timezone: 10000,
    sunrise: sunrise,
    sunset: sunset,
  ),
);

// Home view model
final homeViewModelSuccess = HomeViewModel(
  latitude: locationSuccess.latitude!,
  longitude: locationSuccess.longitude!,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: [
    WeatherDayViewModel(
      date: currentDay,
      weatherData: [
        WeatherDetailsViewModel(
          time: currentDayDetailsFirstPosition,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
        WeatherDetailsViewModel(
          time: currentDayDetailsSecondPosition,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
      ],
    ),
    WeatherDayViewModel(
      date: nextDay,
      weatherData: [
        WeatherDetailsViewModel(
          time: nextDay,
          icon: Uint8List(1),
          precipitation: 30.0,
          clouds: 30,
          visibility: 20,
          windSpeed: 60,
          pressure: 10,
          minTemperature: 3,
          maxTemperature: 40,
          temperature: -263,
          weather: 'weatherDetailsEntity',
        ),
      ],
    ),
  ],
);
