import 'dart:typed_data';

import 'package:weather/data/local/weather_day_local_entity.dart';
import 'package:weather/data/local/weather_details_local_entity.dart';
import 'package:weather/data/local/weather_local_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/city_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/clouds_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/coord_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/list_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/main_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/rain_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/sys_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_details_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/weather_remote_entity.dart';
import 'package:weather/data/remote/weather/models/weather_remote_entity/wind_remote_entity.dart';
import 'package:weather/domain/models/business/weather_business.dart';
import 'package:weather/domain/models/business/weather_data_business.dart';
import 'package:weather/domain/models/business/weather_day_business.dart';
import 'package:weather/domain/models/city_entity.dart';
import 'package:weather/domain/models/main_entity.dart';
import 'package:weather/domain/models/weather_data_entity.dart';
import 'package:weather/domain/models/weather_details_entity.dart';
import 'package:weather/domain/models/weather_entity.dart';
import 'package:weather/domain/models/wind_entity.dart';

// Dates
final sunrise = DateTime(2024, 09, 09);
final sunset = DateTime(2024, 10, 10);
final currentDate = DateTime(2024, 09, 09, 10, 10, 10);

// Weather business
final successResult = WeatherBusiness(
  latitude: 0.0,
  longitude: 1.0,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: [
    WeatherDayBusiness(
      date: currentDate,
      weatherData: [
        WeatherDataBusiness(
          time: currentDate,
          icon: Uint8List(1),
          precipitation: 10.0,
          clouds: 20,
          visibility: 30,
          windSpeed: 40.0,
          pressure: 50,
          minTemperature: 60.0,
          maxTemperature: 70.0,
          temperature: 65.0,
          weather: 'weather',
        ),
      ],
    ),
  ],
);

// Weather local entities
final successLocalResponse = WeatherLocalEntity(
  latitude: 0.0,
  longitude: 1.0,
  locationName: 'locationName',
  sunrise: sunrise,
  sunset: sunset,
  weatherDays: [
    WeatherDayLocalEntity(
      date: currentDate,
      weatherData: [
        WeatherDetailsLocalEntity(
          time: currentDate,
          icon: Uint8List(1),
          precipitation: 10.0,
          clouds: 20,
          visibility: 30,
          windSpeed: 40.0,
          pressure: 50,
          minTemperature: 60.0,
          maxTemperature: 70.0,
          temperature: 65.0,
          weather: 'weather',
        ),
      ],
    ),
  ],
);

// Weather data entity
final successEntityResult = WeatherEntity(
  cod: '100',
  message: 1,
  cnt: 2,
  details: [
    WeatherDataEntity(
      date: DateTime.fromMillisecondsSinceEpoch(1729674000),
      main: const MainEntity(
        temperature: 5,
        temperatureFeeling: 12,
        minTemperature: 0,
        maxTemperature: 20,
        pressure: 6,
        seaLevel: 7,
        groundLevel: 8,
        humidity: 9,
        temperatureKf: 273.0,
      ),
      details: const [
        WeatherDetailsEntity(
          id: 30,
          main: 'main',
          description: 'description',
          icon: '10n',
        ),
      ],
      clouds: 30,
      wind: const WindEntity(
        speed: 50.0,
        degrees: 14,
        gust: 60.0,
      ),
      pop: 70.0,
      precipitation: 80.0,
      isNight: true,
      visibility: 90,
    ),
  ],
  city: CityEntity(
    id: 3,
    name: 'locationName',
    latitude: 1.0,
    longitude: 0.0,
    country: 'locationName',
    population: 10,
    timezone: 100000000,
    sunrise: DateTime.fromMillisecondsSinceEpoch(1729674000),
    sunset: DateTime.fromMillisecondsSinceEpoch(1729674000),
  ),
);

// Weather remote entities
final successRemoteResponse = WeatherRemoteEntity(
  cod: '100',
  message: 1,
  cnt: 2,
  list: [
    ListRemoteEntity(
      dt: 1729674,
      main: MainRemoteEntity(
        temp: 5.0,
        feelsLike: 12.0,
        tempMax: 20.0,
        tempMin: 0.0,
        pressure: 6,
        seaLevel: 7,
        grndLevel: 8,
        humidity: 9,
        tempKf: 273.0,
      ),
      weather: [
        WeatherDetailsRemoteEntity(
          id: 30,
          main: 'main',
          description: 'description',
          icon: '10n',
        ),
      ],
      clouds: CloudsRemoteEntity(
        all: 30,
      ),
      wind: WindRemoteEntity(
        speed: 50.0,
        deg: 14,
        gust: 60.0,
      ),
      pop: 70.0,
      rain: RainRemoteEntity(
        precipitation: 80.0,
      ),
      visibility: 90,
      sys: SysRemoteEntity(
        pod: 'n',
      ),
    ),
  ],
  city: CityRemoteEntity(
    id: 3,
    name: 'locationName',
    coord: CoordRemoteEntity(
      lat: 1.0,
      lon: 0.0,
    ),
    country: 'locationName',
    population: 10,
    timezone: 100000000,
    sunrise: 1729674000,
    sunset: 1729674000,
  ),
);
