import 'package:json_annotation/json_annotation.dart';

part 'coord_remote_entity.g.dart';

@JsonSerializable()
class CoordRemoteEntity {
  double? lat;
  double? lon;

  CoordRemoteEntity({this.lat, this.lon});

  factory CoordRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$CoordRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CoordRemoteEntityToJson(this);
}
