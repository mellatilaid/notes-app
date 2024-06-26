// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoItemModelAdapter extends TypeAdapter<ToDoItemModel> {
  @override
  final int typeId = 4;

  @override
  ToDoItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoItemModel(
      title: fields[0] as String,
      isChecked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
