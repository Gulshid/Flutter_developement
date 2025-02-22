// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hive_notes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notes1Adapter extends TypeAdapter<notes_1> {
  @override
  final int typeId = 0;

  @override
  notes_1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notes_1(
      title: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notes_1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notes1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
