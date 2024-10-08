// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityRemoteEntity _$CityRemoteEntityFromJson(Map<String, dynamic> json) =>
    CityRemoteEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      coord: json['coord'] == null
          ? null
          : CoordRemoteEntity.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String?,
      population: (json['population'] as num?)?.toInt(),
      timezone: (json['timezone'] as num?)?.toInt(),
      sunrise: (json['sunrise'] as num?)?.toInt(),
      sunset: (json['sunset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityRemoteEntityToJson(CityRemoteEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };