// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDayLocalEntityAdapter extends TypeAdapter<WeatherDayLocalEntity> {
  @override
  final int typeId = 3;

  @override
  WeatherDayLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDayLocalEntity(
      date: fields[0] as DateTime,
      weatherData: (fields[1] as List).cast<WeatherDetailsLocalEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDayLocalEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weatherData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDayLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
