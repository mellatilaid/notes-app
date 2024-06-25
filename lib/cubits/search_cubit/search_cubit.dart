import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/search_cubit/search_state.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../../helper/const.dart';
import '../../models/note_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());
  List<NoteModel>? notes;
  search(String query, SearchType searchType) {
    List<dynamic> results = [];
    emit(SearchInitialState());

    switch (searchType) {
      case SearchType.notes:
        var notesBox = Hive.box<NoteModel>(kTextNoteBox);
        results = notesBox.values
            .where((note) =>
                note.title.contains(query) || note.content.contains(query))
            .toList();
        results = results as List<NoteModel>;
        break;
      case SearchType.folders:
        var folderBox = Hive.box<FolderModel>(kFoldersBox);
        results = folderBox.values
            .where((note) => note.title.contains(query))
            .toList();
        break;
      case SearchType.tasks:
        var tasksBox = Hive.box<TasksListModel>(kTasksListBox);
        results = tasksBox.values
            .where((note) =>
                (note.title != null) ? note.title!.contains(query) : false)
            .toList();
        break;
      case SearchType.reminders:
        var remindersBox = Hive.box<ReminderModel>(kRemindersBox);
        results = remindersBox.values
            .where((note) => note.title.contains(query))
            .toList();
        break;
      default:
    }

    /* var notesBox = Hive.box<NoteModel>(kTextNoteBox);

    List<NoteModel> notesFromBox = notesBox.values.toList();

    if (query.isNotEmpty) {
      notes = notesFromBox.where((note) {
        final noteTitle = note.title.toLowerCase();
        final input = query.toLowerCase();
        return noteTitle.contains(input);
      }).toList();*/
    log(results[0].toString());
    emit(SearchSecussState(resualt: results));
  }
}
