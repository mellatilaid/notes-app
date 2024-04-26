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
      imageTitle: fields[0] as String?,
      imageContent: fields[2] as String?,
      imagePath: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageNoteModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imageTitle)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.imageContent);
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
