// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRemoteEntity _$ListRemoteEntityFromJson(Map<String, dynamic> json) =>
    ListRemoteEntity(
      dt: (json['dt'] as num?)?.toInt(),
      main: json['main'] == null
          ? null
          : MainRemoteEntity.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              WeatherDetailsRemoteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] == null
          ? null
          : CloudsRemoteEntity.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindRemoteEntity.fromJson(json['wind'] as Map<String, dynamic>),
      pop: (json['pop'] as num?)?.toDouble(),
      rain: json['rain'] == null
          ? null
          : RainRemoteEntity.fromJson(json['rain'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : SysRemoteEntity.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String?,
      visibility: (json['visibility'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ListRemoteEntityToJson(ListRemoteEntity instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'pop': instance.pop,
      'rain': instance.rain,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
      'visibility': instance.visibility,
    };
