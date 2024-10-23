import 'package:json_annotation/json_annotation.dart';

import 'clouds_remote_entity.dart';
import 'main_remote_entity.dart';
import 'rain_remote_entity.dart';
import 'sys_remote_entity.dart';
import 'weather_details_remote_entity.dart';
import 'wind_remote_entity.dart';

part 'list_remote_entity.g.dart';

@JsonSerializable()
class ListRemoteEntity {
  int? dt;
  MainRemoteEntity? main;
  List<WeatherDetailsRemoteEntity>? weather;
  CloudsRemoteEntity? clouds;
  WindRemoteEntity? wind;
  double? pop;
  RainRemoteEntity? rain;
  SysRemoteEntity? sys;
  @JsonKey(name: 'dt_txt')
  String? dtTxt;
  int? visibility;

  ListRemoteEntity({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
    this.visibility,
  });

  factory ListRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$ListRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ListRemoteEntityToJson(this);
}
