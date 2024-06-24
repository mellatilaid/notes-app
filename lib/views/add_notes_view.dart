import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/add_note_view_body.dart';

class AddNotesView extends StatelessWidget {
  final TabController textNoteTabController;
  const AddNotesView({super.key, required this.textNoteTabController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text('Add Note'),
          actions: const [],
        ),
        body: AddNoteViewBody(
          textNoteTabController: textNoteTabController,
        ),
      ),
    );
  }
}
