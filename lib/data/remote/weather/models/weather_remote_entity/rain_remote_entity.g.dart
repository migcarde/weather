// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RainRemoteEntity _$RainRemoteEntityFromJson(Map<String, dynamic> json) =>
    RainRemoteEntity(
      precipitation: (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RainRemoteEntityToJson(RainRemoteEntity instance) =>
    <String, dynamic>{
      '3h': instance.precipitation,
    };
