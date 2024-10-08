// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRemoteEntity _$WeatherRemoteEntityFromJson(Map<String, dynamic> json) =>
    WeatherRemoteEntity(
      cod: json['cod'] as String?,
      message: (json['message'] as num?)?.toInt(),
      cnt: (json['cnt'] as num?)?.toInt(),
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListRemoteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : CityRemoteEntity.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherRemoteEntityToJson(
        WeatherRemoteEntity instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
