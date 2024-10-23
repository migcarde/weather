import 'package:json_annotation/json_annotation.dart';

import 'city_remote_entity.dart';
import 'list_remote_entity.dart';

part 'weather_remote_entity.g.dart';

@JsonSerializable()
class WeatherRemoteEntity {
  String? cod;
  int? message;
  int? cnt;
  List<ListRemoteEntity>? list;
  CityRemoteEntity? city;

  WeatherRemoteEntity({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherRemoteEntity.fromJson(Map<String, dynamic> json) {
    return _$WeatherRemoteEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherRemoteEntityToJson(this);
}
