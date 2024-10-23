// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDetailsLocalEntityAdapter
    extends TypeAdapter<WeatherDetailsLocalEntity> {
  @override
  final int typeId = 4;

  @override
  WeatherDetailsLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDetailsLocalEntity(
      time: fields[0] as DateTime,
      icon: fields[1] as Uint8List,
      precipitation: fields[2] as double,
      clouds: fields[3] as int,
      visibility: fields[4] as int,
      windSpeed: fields[5] as double,
      pressure: fields[6] as int,
      minTemperature: fields[7] as double,
      maxTemperature: fields[8] as double,
      temperature: fields[9] as double,
      weather: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDetailsLocalEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.precipitation)
      ..writeByte(3)
      ..write(obj.clouds)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.windSpeed)
      ..writeByte(6)
      ..write(obj.pressure)
      ..writeByte(7)
      ..write(obj.minTemperature)
      ..writeByte(8)
      ..write(obj.maxTemperature)
      ..writeByte(9)
      ..write(obj.temperature)
      ..writeByte(10)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDetailsLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
