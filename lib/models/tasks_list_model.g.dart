// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksListModelAdapter extends TypeAdapter<TasksListModel> {
  @override
  final int typeId = 5;

  @override
  TasksListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksListModel(
      title: fields[0] as String?,
      tasksList: (fields[1] as List).cast<ToDoItemModel>(),
      color: fields[2] as int,
      date: fields[3] as String,
      id: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TasksListModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.tasksList)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
