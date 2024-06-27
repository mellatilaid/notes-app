import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/bottom_navigation_bar.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folders_cubit/folders_cubit.dart';
import 'package:note_app/cubits/image_notes_cubits_folder/image_notes_cubit/image_notes_cubit_cubit.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
import 'package:note_app/cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/simple_add_note_cubit_abserver.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/services/local_notifications_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'models/note_model.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
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
  await Hive.openBox<TasksListModel>(kTasksListBox);
  Hive.registerAdapter(ReminderModelAdapter());
  await Hive.openBox<ReminderModel>(kRemindersBox);
  await LocalNotifications.init();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://068124ccff399313e15a047502cddfa8@o4506723427352576.ingest.us.sentry.io/4507463934148608';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      const NotesApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        const Color(0xFF6D9EBD).withOpacity(0.5), // Use your custom color here
    systemNavigationBarIconBrightness:
        Brightness.light, // Adjust icon brightness as needed
  ));
  //runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalFeedbackLocalizationsDelegate(),
      ],
      localeOverride: const Locale('en'),
      child: MultiBlocProvider(
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
          BlocProvider(
            create: (context) => RemindersCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const BottomNavPage(),
        ),
      ),
    );
  }
}
