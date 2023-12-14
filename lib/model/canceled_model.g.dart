// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canceled_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CanceldModelAdapter extends TypeAdapter<CanceldModel> {
  @override
  final int typeId = 4;

  @override
  CanceldModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CanceldModel(
      index: fields[0] as int?,
      doctorname: fields[2] as String,
      doctorspecality: fields[3] as String,
      doctorpic: fields[1] as String,
      name: fields[4] as String,
      phone: fields[5] as String,
      age: fields[6] as String,
      gender: fields[7] as String,
      problem: fields[8] as String,
      time: fields[9] as String,
      date: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CanceldModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.doctorpic)
      ..writeByte(2)
      ..write(obj.doctorname)
      ..writeByte(3)
      ..write(obj.doctorspecality)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.problem)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CanceldModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
