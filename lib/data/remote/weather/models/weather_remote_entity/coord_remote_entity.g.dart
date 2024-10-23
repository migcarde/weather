// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordRemoteEntity _$CoordRemoteEntityFromJson(Map<String, dynamic> json) =>
    CoordRemoteEntity(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordRemoteEntityToJson(CoordRemoteEntity instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
