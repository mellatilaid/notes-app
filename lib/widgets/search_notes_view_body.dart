import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/search_note_cubit/search_note_state.dart';
import 'package:note_app/helper/slidable_note_enums.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/search_text_field.dart';
import 'package:note_app/widgets/text_notes_list_view.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (data) {
                BlocProvider.of<SearchNoteCubit>(context).searchNotes(data);
              },
            ),
            SegmentedButton(
              segments: const <ButtonSegment>[
                ButtonSegment(
                  value: 'laid',
                  label: Text('primary'),
                ),
                ButtonSegment(
                  value: 'mellati',
                  label: Text('secondry'),
                ),
              ],
              selected: const <dynamic>{},
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
                  } else if (state is SearchSecussState) {
                    return TextNotesListview(
                        notesCubitSource: NotesCubitSource.searchCubit,
                        textNotes: state.notes);
                  } else if (state is SearchFailedState) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else {
                    return const Center(
                      child: Text('oops there was a problem'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchNotes(String query) {
    var notesBox = Hive.box<NoteModel>(kTextNoteBox);

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
