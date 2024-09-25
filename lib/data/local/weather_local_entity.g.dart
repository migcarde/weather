// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherLocalEntityAdapter extends TypeAdapter<WeatherLocalEntity> {
  @override
  final int typeId = 1;

  @override
  WeatherLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherLocalEntity(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      locationName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherLocalEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.locationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}