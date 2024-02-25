import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/bottom_navigation_bar.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/cubits/notes_cubits_folder/add_note_cubit/simple_add_note_cubit_abserver.dart';
import 'package:note_app/cubits/notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';

import 'models/note_model.dart';

void main() async {
  Bloc.observer = AddNoteObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  Hive.registerAdapter(FolderModelAdapter());
  await Hive.openBox<FolderModel>(kFoldersBox);
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
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const BottomNavPage(),
      ),
    );
  }
}
