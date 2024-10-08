import 'package:json_annotation/json_annotation.dart';

part 'main_remote_entity.g.dart';

@JsonSerializable()
class MainRemoteEntity {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  @JsonKey(name: 'sea_level')
  int? seaLevel;
  @JsonKey(name: 'grnd_level')
  int? grndLevel;
  int? humidity;
  @JsonKey(name: 'temp_kf')
  double? tempKf;

  MainRemoteEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory MainRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$MainRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MainRemoteEntityToJson(this);
}
