// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksListAdapter extends TypeAdapter<TasksList> {
  @override
  final int typeId = 5;

  @override
  TasksList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksList(
      title: fields[0] as String?,
      tasksList: (fields[1] as List).cast<ToDoItemModel>(),
      color: fields[2] as int,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TasksList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.tasksList)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
