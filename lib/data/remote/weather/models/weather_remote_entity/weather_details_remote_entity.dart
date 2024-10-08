import 'package:json_annotation/json_annotation.dart';

part 'weather_details_remote_entity.g.dart';

@JsonSerializable()
class WeatherDetailsRemoteEntity {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDetailsRemoteEntity({this.id, this.main, this.description, this.icon});

  factory WeatherDetailsRemoteEntity.fromJson(Map<String, dynamic> json) {
    return _$WeatherDetailsRemoteEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherDetailsRemoteEntityToJson(this);
}
