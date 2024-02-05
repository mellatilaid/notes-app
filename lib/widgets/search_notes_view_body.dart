import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/notes_list_view.dart';

import '../helper/const.dart';

class SearchNotesViewBody extends StatefulWidget {
  const SearchNotesViewBody({super.key});

  @override
  State<SearchNotesViewBody> createState() => _SearchNotesViewBodyState();
}

class _SearchNotesViewBodyState extends State<SearchNotesViewBody> {
  List<NoteModel> notes = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              _searchNotes(value);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              hintText: 'Search',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: NotesListView(notes: notes),
          ),
        ],
      ),
    );
  }

  void _searchNotes(String query) {
    var notesBox = Hive.box<NoteModel>(kNoteBox);

    List<NoteModel> notesFromBox = notesBox.values.toList();

    if (query.isNotEmpty) {
      final suggestions = notesFromBox.where((note) {
        final noteTitle = note.title.toLowerCase();
        final input = query.toLowerCase();
        return noteTitle.contains(input);
      }).toList();

      setState(() {
        notes = suggestions;
      });
    } else {
      setState(() {
        notes = [];
      });
    }
  }
}
