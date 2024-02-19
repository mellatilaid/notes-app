// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FolderModelAdapter extends TypeAdapter<FolderModel> {
  @override
  final int typeId = 1;

  @override
  FolderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FolderModel(
      title: fields[0] as String,
      color: fields[2] as int,
      folders: (fields[4] as List).cast<FolderModel>(),
      notes: (fields[3] as List).cast<NoteModel>(),
      coverPath: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FolderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.coverPath)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.folders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
