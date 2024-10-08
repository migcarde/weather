import 'package:json_annotation/json_annotation.dart';

part 'rain_remote_entity.g.dart';

@JsonSerializable()
class RainRemoteEntity {
  @JsonKey(name: '3h')
  double? precipitation;

  RainRemoteEntity({
    this.precipitation,
  });

  factory RainRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$RainRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RainRemoteEntityToJson(this);
}
