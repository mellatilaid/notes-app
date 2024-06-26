// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageNoteModelAdapter extends TypeAdapter<ImageNoteModel> {
  @override
  final int typeId = 3;

  @override
  ImageNoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageNoteModel(
      title: fields[0] as String,
      content: fields[2] as String?,
      imagePath: fields[1] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageNoteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageNoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
