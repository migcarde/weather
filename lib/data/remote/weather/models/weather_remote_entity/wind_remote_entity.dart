import 'package:json_annotation/json_annotation.dart';

part 'wind_remote_entity.g.dart';

@JsonSerializable()
class WindRemoteEntity {
  double? speed;
  int? deg;
  double? gust;

  WindRemoteEntity({this.speed, this.deg, this.gust});

  factory WindRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$WindRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WindRemoteEntityToJson(this);
}
