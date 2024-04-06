// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VoiceNoteModelAdapter extends TypeAdapter<VoiceNoteModel> {
  @override
  final int typeId = 2;

  @override
  VoiceNoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VoiceNoteModel(
      title: fields[0] as String,
      content: fields[1] as String?,
      voicePath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VoiceNoteModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.voicePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoiceNoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
