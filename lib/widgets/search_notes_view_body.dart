import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/cubits/search_note_cubit/search_note_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/notes_list_view.dart';
import 'package:note_app/widgets/search_text_field.dart';

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
          SearchTextField(
            onChanged: (data) {
              BlocProvider.of<SearchNoteCubit>(context).searchNotes(data);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: BlocBuilder<SearchNoteCubit, SearchNoteState>(
              builder: (context, state) {
                if (state is SearchInitialState) {
                  return const Center(
                    child: Text('Search Your Notes'),
                  );
                }
                return NotesListView(notes: notes);
              },
            ),
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
