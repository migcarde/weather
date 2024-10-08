import 'package:json_annotation/json_annotation.dart';

part 'clouds_remote_entity.g.dart';

@JsonSerializable()
class CloudsRemoteEntity {
  int? all;

  CloudsRemoteEntity({this.all});

  factory CloudsRemoteEntity.fromJson(Map<String, dynamic> json) {
    return _$CloudsRemoteEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CloudsRemoteEntityToJson(this);
}
