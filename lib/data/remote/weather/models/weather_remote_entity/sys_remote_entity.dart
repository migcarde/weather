import 'package:json_annotation/json_annotation.dart';

part 'sys_remote_entity.g.dart';

@JsonSerializable()
class SysRemoteEntity {
  String? pod;

  SysRemoteEntity({this.pod});

  factory SysRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$SysRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SysRemoteEntityToJson(this);
}
