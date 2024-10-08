// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindRemoteEntity _$WindRemoteEntityFromJson(Map<String, dynamic> json) =>
    WindRemoteEntity(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: (json['deg'] as num?)?.toInt(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindRemoteEntityToJson(WindRemoteEntity instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
