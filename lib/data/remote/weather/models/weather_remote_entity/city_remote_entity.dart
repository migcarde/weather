import 'package:json_annotation/json_annotation.dart';

import 'coord_remote_entity.dart';

part 'city_remote_entity.g.dart';

@JsonSerializable()
class CityRemoteEntity {
  int? id;
  String? name;
  CoordRemoteEntity? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityRemoteEntity({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory CityRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$CityRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CityRemoteEntityToJson(this);
}
