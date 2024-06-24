import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/add_note_cubit_states.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNoteViewBody extends StatelessWidget {
  final TabController textNoteTabController;
  const AddNoteViewBody({super.key, required this.textNoteTabController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccuss || state is AddNoteEmpty) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
          textNoteTabController.animateTo(0);
        } else if (state is AddNoteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: AddNoteForm(),
        );
      },
    );
  }
}
