// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailsRemoteEntity _$WeatherDetailsRemoteEntityFromJson(
        Map<String, dynamic> json) =>
    WeatherDetailsRemoteEntity(
      id: (json['id'] as num?)?.toInt(),
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDetailsRemoteEntityToJson(
        WeatherDetailsRemoteEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
