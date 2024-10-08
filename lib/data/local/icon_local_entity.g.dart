// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IconLocalEntityAdapter extends TypeAdapter<IconLocalEntity> {
  @override
  final int typeId = 2;

  @override
  IconLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconLocalEntity(
      id: fields[0] as int,
      image: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, IconLocalEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
