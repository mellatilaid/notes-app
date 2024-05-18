import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/bottom_navigation_bar.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
import 'package:note_app/cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/simple_add_note_cubit_abserver.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';
import 'package:note_app/models/voice_note_model.dart';

import 'models/note_model.dart';

void main() async {
  Bloc.observer = AddNoteObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kTextNoteBox);
  Hive.registerAdapter(FolderModelAdapter());
  await Hive.openBox<FolderModel>(kFoldersBox);
  Hive.registerAdapter(VoiceNoteModelAdapter());
  await Hive.openBox<VoiceNoteModel>(kVoiceNoteBox);
  Hive.registerAdapter(ImageNoteModelAdapter());
  await Hive.openBox<ImageNoteModel>(kImageNoteBox);
  Hive.registerAdapter(ToDoItemModelAdapter());
  Hive.registerAdapter(TasksListModelAdapter());
  Hive.openBox<TasksListModel>(kTasksListBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => FoldersCubit(),
        ),
        BlocProvider(
          create: (context) => SubNotesCubit(),
        ),
        BlocProvider(
          create: (context) => AddSubNoteCubit(),
        ),
        BlocProvider(
          create: (context) => EditSubNoteCubit(),
        ),
        BlocProvider(
          create: (context) => VoiceNotesCubit(),
        ),
        BlocProvider(
          create: (context) => ImageNotesCubit(),
        ),
        BlocProvider(
          create: (context) => FetchTasksListCubit(),
        ),
        BlocProvider(
          create: (context) => EditTasksListCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const BottomNavPage(),
      ),
    );
  }
}

class CustomReorderListView extends StatefulWidget {
  const CustomReorderListView({super.key});

  @override
  State<CustomReorderListView> createState() => _CustomReorderListViewState();
}

class _CustomReorderListViewState extends State<CustomReorderListView> {
  final List tasks = ['a', 'b', 'c', 'd'];

  void updateTasks(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String task = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, task);
    });
  }

  void logTasksList() {
    for (var task in tasks) {
      log(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            updateTasks(oldIndex, newIndex);
            logTasksList();
          },
          children: List.generate(tasks.length, (index) {
            return Card(
              key: ValueKey(tasks[index]),
              child: ListTile(
                title: Text(tasks[index]),
                trailing: const Icon(Icons.drag_handle),
              ),
            );
          }),
        ),
      ),
    );
  }
}
